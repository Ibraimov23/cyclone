import 'package:cyclone/generated/l10n.dart';
import 'package:cyclone/widget/custom_app-bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String username;
  final String fullEmail;
  final VoidCallback onLogout;

  const Profile({
    super.key,
    required this.username,
    required this.fullEmail,
    required this.onLogout,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController _emailController;
  bool _isEditingEmail = false;
  bool _showConfirmButton = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.fullEmail);
  }

  void _onEmailChanged(String value) {
    setState(() {
      _showConfirmButton = value.trim() != widget.fullEmail;
    });
  }

  Future<bool> _checkEmailExists(String email) async {
    try {
      final auth = FirebaseAuth.instance;
      final user = await auth.fetchSignInMethodsForEmail(email);

      print(user);
      return user.isNotEmpty;
    } catch (e) {
      print("Error checking email existence: $e");
      return false;
    }
  }

  void _confirmEmailChange() async {
    final newEmail = _emailController.text.trim();
    final loc = S.of(context);

    if (newEmail == widget.fullEmail) {
      return;
    }

    final emailExists = await _checkEmailExists(newEmail);
    print(emailExists);

    if (emailExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loc.emailAlreadyRegistered),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      try {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          await user.verifyBeforeUpdateEmail(newEmail);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(loc.confirmationSent(newEmail)),
              backgroundColor: const Color(0xFF90010A),
            ),
          );

          setState(() {
            _isEditingEmail = false;
            _showConfirmButton = false;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(loc.userNotFoundError),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(loc.confirmationSendError(e.toString())),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);

    return GestureDetector(
      onTap: () {
        if (_isEditingEmail) {
          setState(() {
            _isEditingEmail = false;
            _showConfirmButton = false;
          });
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFE7E7E7),
        appBar: CustomAppBar(
          title: loc.greeting(widget.username),
          onMenuTap: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/pattern.png'),
              fit: BoxFit.none,
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white.withOpacity(0.95),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/alina.png',
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.username,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (_isEditingEmail)
                          Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                onChanged: _onEmailChanged,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  border: const OutlineInputBorder(),
                                  labelText: loc.emailLabel,
                                ),
                                autofocus: true,
                                cursorColor: const Color(0xFF90010A),
                              ),
                              const SizedBox(height: 10),
                              if (_showConfirmButton)
                                ElevatedButton(
                                  onPressed: _confirmEmailChange,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF90010A),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 12),
                                    child: Text(
                                      loc.confirmButton,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                            ],
                          )
                        else
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.fullEmail,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    decoration: TextDecoration.underline,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit,
                                    size: 20, color: Colors.black45),
                                onPressed: () {
                                  setState(() {
                                    _isEditingEmail = true;
                                  });
                                },
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                _buildButton(
                  text: loc.changePassword,
                  icon: Icons.lock_outline,
                  onPressed: () {
                    Navigator.pushNamed(context, '/newpassword');
                  },
                ),
                const SizedBox(height: 20),
                _buildButton(
                  text: loc.settings,
                  icon: Icons.settings,
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                _buildButton(
                  text: loc.logout,
                  icon: Icons.logout,
                  onPressed: widget.onLogout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 22),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF90010A),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
        ),
      ),
    );
  }
}
