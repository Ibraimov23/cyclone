import 'package:cyclone/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthService> authService = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<UserCredential> createAccount({
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
  }) async {
    if (password != confirmPassword) {
      throw Exception("Пароли не совпадают");
    }
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signIn(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw FirebaseAuthException(
          code: 'INVALID_INPUT',
          message: 'Email и пароль не могут быть пустыми.',
        );
      }

      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        if (!userCredential.user!.emailVerified) {
          print("Email НЕ подтвержден");
          await firebaseAuth.signOut();
          throw FirebaseAuthException(
            code: 'EMAIL_NOT_VERIFIED',
            message: 'Email не подтвержден. Пожалуйста, подтвердите ваш email.',
          );
        } else {
          print("Вход выполнен");
        }
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw e;
      } else {
        throw FirebaseAuthException(
          code: 'UNKNOWN_ERROR',
          message: 'Неизвестная ошибка: $e',
        );
      }
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    return await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  }

  /*Future<void> resetPasswordFromCurrentPassword({
    required String email,
    required String password,
    required String newPassword,
  }) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }*/

  Future<String?> signUpAndSendEmailVerification({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      if (password != confirmPassword) {
        return "Пароли не совпадают";
      }

      if (firebaseAuth.currentUser != null) {
        await firebaseAuth.signOut();
        print("Выход из текущего аккаунта");
      }

      final signInMethods =
          await firebaseAuth.fetchSignInMethodsForEmail(email);
      if (signInMethods.isNotEmpty) {
        return "Аккаунт с таким email уже существует. Попробуйте войти.";
      }

      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        print("Письмо с подтверждением отправлено.");

        return "email-send";
      }

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "Аккаунт с таким email уже существует. Попробуйте войти.";
      } else if (e.code == 'weak-password') {
        return "Пароль слишком слабый. Попробуйте использовать более сложный пароль.";
      } else if (e.code == 'invalid-email') {
        return "Некорректный email. Пожалуйста, введите правильный email.";
      } else {
        return e.message ?? "Ошибка при регистрации";
      }
    } catch (e) {
      return "Неизвестная ошибка: $e";
    }
  }

  Future<void> waitForEmailVerification(BuildContext context) async {
    User? user = firebaseAuth.currentUser;
    while (user != null && !user.emailVerified) {
      await Future.delayed(Duration(seconds: 5));
      await user.reload();
      user = firebaseAuth.currentUser;
    }

    if (user != null && user.emailVerified) {
      print("Email подтвержден");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }

  Future<void> checkEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.reload();
    if (user != null && user.emailVerified) {
      print("Email подтвержден");
    } else {
      print("Email НЕ подтвержден");
    }
  }

  Future<void> resendVerificationEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      print("Письмо отправлено повторно");
    }
  }

  Future<String> resetPasswordFromCurrentPassword(
      String newPassword, String confirmPassword) async {
    try {
      if (newPassword.isEmpty || confirmPassword.isEmpty) {
        return "Пароли не могут быть пустыми.";
      }

      if (newPassword != confirmPassword) {
        return "Пароли не совпадают.";
      }

      User? user = firebaseAuth.currentUser;

      if (user == null) {
        return "Пользователь не найден. Пожалуйста, войдите в систему.";
      }

      await user.updatePassword(newPassword);
      await user.reload();

      return "Пароль успешно изменен.";
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e);
    } catch (e) {
      return "Неизвестная ошибка: $e";
    }
  }

  String _handleAuthError(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      return "Пароль слишком слабый. Попробуйте использовать более сложный пароль.";
    } else if (e.code == 'user-not-found') {
      return "Пользователь не найден.";
    } else if (e.code == 'operation-not-allowed') {
      return "Эта операция не разрешена.";
    } else {
      return e.message ?? "Ошибка при изменении пароля.";
    }
  }
}
