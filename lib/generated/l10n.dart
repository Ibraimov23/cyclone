// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Select language`
  String get languagePrompt {
    return Intl.message(
      'Select language',
      name: 'languagePrompt',
      desc: '',
      args: [],
    );
  }

  /// `Kyrgyz`
  String get kyrgyz {
    return Intl.message('Kyrgyz', name: 'kyrgyz', desc: '', args: []);
  }

  /// `Russian`
  String get russian {
    return Intl.message('Russian', name: 'russian', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Choose`
  String get selectButton {
    return Intl.message('Choose', name: 'selectButton', desc: '', args: []);
  }

  /// `CYCLONE APP`
  String get welcomeTitle {
    return Intl.message(
      'CYCLONE APP',
      name: 'welcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Complete automation of the\ncattle fattening process`
  String get welcomeSubtitle {
    return Intl.message(
      'Complete automation of the\ncattle fattening process',
      name: 'welcomeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get welcomeLogin {
    return Intl.message('Login', name: 'welcomeLogin', desc: '', args: []);
  }

  /// `Register`
  String get registerButton {
    return Intl.message('Register', name: 'registerButton', desc: '', args: []);
  }

  /// `Login`
  String get loginTitle {
    return Intl.message('Login', name: 'loginTitle', desc: '', args: []);
  }

  /// `Enter your email`
  String get loginEmailHint {
    return Intl.message(
      'Enter your email',
      name: 'loginEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get loginPasswordHint {
    return Intl.message(
      'Enter your password',
      name: 'loginPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get loginForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'loginForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `Or sign in with`
  String get loginOrSignInWith {
    return Intl.message(
      'Or sign in with',
      name: 'loginOrSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get loginNoAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'loginNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get loginSignUpButton {
    return Intl.message(
      'Sign Up',
      name: 'loginSignUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Account already exists`
  String get accountAlreadyExistsTitle {
    return Intl.message(
      'Account already exists',
      name: 'accountAlreadyExistsTitle',
      desc: '',
      args: [],
    );
  }

  /// `This email is already registered. Try to login.`
  String get accountAlreadyExistsMessage {
    return Intl.message(
      'This email is already registered. Try to login.',
      name: 'accountAlreadyExistsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get errorTitle {
    return Intl.message('Error', name: 'errorTitle', desc: '', args: []);
  }

  /// `Email sent`
  String get emailSentTitle {
    return Intl.message(
      'Email sent',
      name: 'emailSentTitle',
      desc: '',
      args: [],
    );
  }

  /// `A confirmation email has been sent to your address.`
  String get emailSentMessage {
    return Intl.message(
      'A confirmation email has been sent to your address.',
      name: 'emailSentMessage',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Other registration methods`
  String get otherRegistrationMethods {
    return Intl.message(
      'Other registration methods',
      name: 'otherRegistrationMethods',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Authentication error`
  String get errorAuthentication {
    return Intl.message(
      'Authentication error',
      name: 'errorAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeScreenTitle {
    return Intl.message('Home', name: 'homeScreenTitle', desc: '', args: []);
  }

  /// `Hello, {userName}!`
  String homeWelcomeMessage(Object userName) {
    return Intl.message(
      'Hello, $userName!',
      name: 'homeWelcomeMessage',
      desc: '',
      args: [userName],
    );
  }

  /// `View Latest`
  String get homeViewLatest {
    return Intl.message(
      'View Latest',
      name: 'homeViewLatest',
      desc: '',
      args: [],
    );
  }

  /// `Explore Categories`
  String get homeExploreCategories {
    return Intl.message(
      'Explore Categories',
      name: 'homeExploreCategories',
      desc: '',
      args: [],
    );
  }

  /// `My Farm`
  String get homeTitle {
    return Intl.message('My Farm', name: 'homeTitle', desc: '', args: []);
  }

  /// `Cattle Number`
  String get homeCardSubtitle {
    return Intl.message(
      'Cattle Number',
      name: 'homeCardSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Cattle Details`
  String get detailsTitle {
    return Intl.message(
      'Cattle Details',
      name: 'detailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cattle Type`
  String get detailsCattleType {
    return Intl.message(
      'Cattle Type',
      name: 'detailsCattleType',
      desc: '',
      args: [],
    );
  }

  /// `Cattle Name`
  String get detailsCattleName {
    return Intl.message(
      'Cattle Name',
      name: 'detailsCattleName',
      desc: '',
      args: [],
    );
  }

  /// `Count`
  String get detailsCattleCount {
    return Intl.message(
      'Count',
      name: 'detailsCattleCount',
      desc: '',
      args: [],
    );
  }

  /// `Loading error`
  String get loadingError {
    return Intl.message(
      'Loading error',
      name: 'loadingError',
      desc: '',
      args: [],
    );
  }

  /// `Bulls`
  String get bulls {
    return Intl.message('Bulls', name: 'bulls', desc: '', args: []);
  }

  /// `Cows`
  String get cows {
    return Intl.message('Cows', name: 'cows', desc: '', args: []);
  }

  /// `Goats`
  String get goats {
    return Intl.message('Goats', name: 'goats', desc: '', args: []);
  }

  /// `Sheep`
  String get sheep {
    return Intl.message('Sheep', name: 'sheep', desc: '', args: []);
  }

  /// `Profile`
  String get profileScreenTitle {
    return Intl.message(
      'Profile',
      name: 'profileScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get profileEditButton {
    return Intl.message(
      'Edit Profile',
      name: 'profileEditButton',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get profileUsernameLabel {
    return Intl.message(
      'Username',
      name: 'profileUsernameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get profileEmailLabel {
    return Intl.message('Email', name: 'profileEmailLabel', desc: '', args: []);
  }

  /// `Phone Number`
  String get profilePhoneNumberLabel {
    return Intl.message(
      'Phone Number',
      name: 'profilePhoneNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get profileChangePasswordButton {
    return Intl.message(
      'Change Password',
      name: 'profileChangePasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get profileSignOutButton {
    return Intl.message(
      'Sign Out',
      name: 'profileSignOutButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get profileSignOutConfirmationTitle {
    return Intl.message(
      'Sign Out',
      name: 'profileSignOutConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to sign out?`
  String get profileSignOutConfirmationMessage {
    return Intl.message(
      'Are you sure you want to sign out?',
      name: 'profileSignOutConfirmationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get profileDialogCancel {
    return Intl.message(
      'Cancel',
      name: 'profileDialogCancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get profileDialogConfirm {
    return Intl.message(
      'Confirm',
      name: 'profileDialogConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get shopScreenTitle {
    return Intl.message('Shop', name: 'shopScreenTitle', desc: '', args: []);
  }

  /// `Search products...`
  String get shopSearchHint {
    return Intl.message(
      'Search products...',
      name: 'shopSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get shopFilterButton {
    return Intl.message('Filter', name: 'shopFilterButton', desc: '', args: []);
  }

  /// `Sort By`
  String get shopSortByButton {
    return Intl.message(
      'Sort By',
      name: 'shopSortByButton',
      desc: '',
      args: [],
    );
  }

  /// `New Arrivals`
  String get shopNewArrivals {
    return Intl.message(
      'New Arrivals',
      name: 'shopNewArrivals',
      desc: '',
      args: [],
    );
  }

  /// `Featured Items`
  String get shopFeaturedItems {
    return Intl.message(
      'Featured Items',
      name: 'shopFeaturedItems',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get shopAddToCartButton {
    return Intl.message(
      'Add to Cart',
      name: 'shopAddToCartButton',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get shopCallButton {
    return Intl.message('Call', name: 'shopCallButton', desc: '', args: []);
  }

  /// `Contact us`
  String get shopContactTitle {
    return Intl.message(
      'Contact us',
      name: 'shopContactTitle',
      desc: '',
      args: [],
    );
  }

  /// `Premium quality livestock feed!`
  String get feedTitle {
    return Intl.message(
      'Premium quality livestock feed!',
      name: 'feedTitle',
      desc: '',
      args: [],
    );
  }

  /// `From 1500 soms per sack.`
  String get feedSubtitle {
    return Intl.message(
      'From 1500 soms per sack.',
      name: 'feedSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Our App!`
  String get introSlide1Title {
    return Intl.message(
      'Welcome to Our App!',
      name: 'introSlide1Title',
      desc: '',
      args: [],
    );
  }

  /// `Discover amazing features and content tailored for you.`
  String get introSlide1Text {
    return Intl.message(
      'Discover amazing features and content tailored for you.',
      name: 'introSlide1Text',
      desc: '',
      args: [],
    );
  }

  /// `Easy to Use`
  String get introSlide2Title {
    return Intl.message(
      'Easy to Use',
      name: 'introSlide2Title',
      desc: '',
      args: [],
    );
  }

  /// `Navigate effortlessly and enjoy a seamless experience.`
  String get introSlide2Text {
    return Intl.message(
      'Navigate effortlessly and enjoy a seamless experience.',
      name: 'introSlide2Text',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get introSlide3Title {
    return Intl.message(
      'Get Started',
      name: 'introSlide3Title',
      desc: '',
      args: [],
    );
  }

  /// `Join our community and start your journey today.`
  String get introSlide3Text {
    return Intl.message(
      'Join our community and start your journey today.',
      name: 'introSlide3Text',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get introSkipButton {
    return Intl.message('Skip', name: 'introSkipButton', desc: '', args: []);
  }

  /// `Next`
  String get introNextButton {
    return Intl.message('Next', name: 'introNextButton', desc: '', args: []);
  }

  /// `Done`
  String get introDoneButton {
    return Intl.message('Done', name: 'introDoneButton', desc: '', args: []);
  }

  /// `Home`
  String get drawerHome {
    return Intl.message('Home', name: 'drawerHome', desc: '', args: []);
  }

  /// `Profile`
  String get drawerProfile {
    return Intl.message('Profile', name: 'drawerProfile', desc: '', args: []);
  }

  /// `Shop`
  String get drawerShop {
    return Intl.message('Shop', name: 'drawerShop', desc: '', args: []);
  }

  /// `Language`
  String get drawerLanguage {
    return Intl.message('Language', name: 'drawerLanguage', desc: '', args: []);
  }

  /// `Instructions`
  String get drawerInstructions {
    return Intl.message(
      'Instructions',
      name: 'drawerInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Subscription`
  String get drawerSubscription {
    return Intl.message(
      'Subscription',
      name: 'drawerSubscription',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get drawerStats {
    return Intl.message('Statistics', name: 'drawerStats', desc: '', args: []);
  }

  /// `Add Account`
  String get drawerAddAccount {
    return Intl.message(
      'Add Account',
      name: 'drawerAddAccount',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon`
  String get drawerSoon {
    return Intl.message('Coming soon', name: 'drawerSoon', desc: '', args: []);
  }

  /// `Settings`
  String get drawerSettings {
    return Intl.message('Settings', name: 'drawerSettings', desc: '', args: []);
  }

  /// `About Us`
  String get drawerAbout {
    return Intl.message('About Us', name: 'drawerAbout', desc: '', args: []);
  }

  /// `Logout`
  String get drawerLogout {
    return Intl.message('Logout', name: 'drawerLogout', desc: '', args: []);
  }

  /// `Add New Item`
  String get addScreenTitle {
    return Intl.message(
      'Add New Item',
      name: 'addScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Item`
  String get addItemButton {
    return Intl.message('Add Item', name: 'addItemButton', desc: '', args: []);
  }

  /// `Add Record`
  String get addRecordButton {
    return Intl.message(
      'Add Record',
      name: 'addRecordButton',
      desc: '',
      args: [],
    );
  }

  /// `Create New`
  String get createNewButton {
    return Intl.message(
      'Create New',
      name: 'createNewButton',
      desc: '',
      args: [],
    );
  }

  /// `Create New Item`
  String get createItemTitle {
    return Intl.message(
      'Create New Item',
      name: 'createItemTitle',
      desc: '',
      args: [],
    );
  }

  /// `Item Name`
  String get itemNameLabel {
    return Intl.message('Item Name', name: 'itemNameLabel', desc: '', args: []);
  }

  /// `Enter item name`
  String get itemNameHint {
    return Intl.message(
      'Enter item name',
      name: 'itemNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get itemDescriptionLabel {
    return Intl.message(
      'Description',
      name: 'itemDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter a description`
  String get itemDescriptionHint {
    return Intl.message(
      'Enter a description',
      name: 'itemDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get itemCategoryLabel {
    return Intl.message(
      'Category',
      name: 'itemCategoryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Select a category`
  String get itemCategoryHint {
    return Intl.message(
      'Select a category',
      name: 'itemCategoryHint',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get itemPriceLabel {
    return Intl.message('Price', name: 'itemPriceLabel', desc: '', args: []);
  }

  /// `Enter price`
  String get itemPriceHint {
    return Intl.message(
      'Enter price',
      name: 'itemPriceHint',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get itemUploadImageButton {
    return Intl.message(
      'Upload Image',
      name: 'itemUploadImageButton',
      desc: '',
      args: [],
    );
  }

  /// `Image Uploaded`
  String get itemImageUploaded {
    return Intl.message(
      'Image Uploaded',
      name: 'itemImageUploaded',
      desc: '',
      args: [],
    );
  }

  /// `No image selected`
  String get itemNoImageSelected {
    return Intl.message(
      'No image selected',
      name: 'itemNoImageSelected',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get saveButton {
    return Intl.message('Save', name: 'saveButton', desc: '', args: []);
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message('Cancel', name: 'cancelButton', desc: '', args: []);
  }

  /// `This field is required`
  String get fieldRequiredError {
    return Intl.message(
      'This field is required',
      name: 'fieldRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid input`
  String get invalidInputError {
    return Intl.message(
      'Invalid input',
      name: 'invalidInputError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Details`
  String get confirmScreenTitle {
    return Intl.message(
      'Confirm Details',
      name: 'confirmScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please review the details before submitting.`
  String get confirmMessage {
    return Intl.message(
      'Please review the details before submitting.',
      name: 'confirmMessage',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get confirmSubmitButton {
    return Intl.message(
      'Submit',
      name: 'confirmSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get confirmEditButton {
    return Intl.message('Edit', name: 'confirmEditButton', desc: '', args: []);
  }

  /// `Identification`
  String get idScreenTitle {
    return Intl.message(
      'Identification',
      name: 'idScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter ID`
  String get enterIdLabel {
    return Intl.message('Enter ID', name: 'enterIdLabel', desc: '', args: []);
  }

  /// `Scan or type ID`
  String get enterIdHint {
    return Intl.message(
      'Scan or type ID',
      name: 'enterIdHint',
      desc: '',
      args: [],
    );
  }

  /// `ID Number:`
  String get idNumberLabel {
    return Intl.message(
      'ID Number:',
      name: 'idNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `ID not found`
  String get idNotFoundError {
    return Intl.message(
      'ID not found',
      name: 'idNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `Verify ID`
  String get verifyIdButton {
    return Intl.message(
      'Verify ID',
      name: 'verifyIdButton',
      desc: '',
      args: [],
    );
  }

  /// `Animal Passport`
  String get animalPassportTitle {
    return Intl.message(
      'Animal Passport',
      name: 'animalPassportTitle',
      desc: '',
      args: [],
    );
  }

  /// `Animal Name`
  String get animalNameLabel {
    return Intl.message(
      'Animal Name',
      name: 'animalNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Species`
  String get animalSpeciesLabel {
    return Intl.message(
      'Species',
      name: 'animalSpeciesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Breed`
  String get animalBreedLabel {
    return Intl.message('Breed', name: 'animalBreedLabel', desc: '', args: []);
  }

  /// `Date of Birth`
  String get animalDateOfBirthLabel {
    return Intl.message(
      'Date of Birth',
      name: 'animalDateOfBirthLabel',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get animalOwnerLabel {
    return Intl.message('Owner', name: 'animalOwnerLabel', desc: '', args: []);
  }

  /// `Microchip ID`
  String get animalMicrochipIdLabel {
    return Intl.message(
      'Microchip ID',
      name: 'animalMicrochipIdLabel',
      desc: '',
      args: [],
    );
  }

  /// `Vaccinations`
  String get animalVaccinationsTitle {
    return Intl.message(
      'Vaccinations',
      name: 'animalVaccinationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Vaccination Record`
  String get addVaccinationButton {
    return Intl.message(
      'Add Vaccination Record',
      name: 'addVaccinationButton',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructionScreenTitle {
    return Intl.message(
      'Instructions',
      name: 'instructionScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Step 1: Getting Started`
  String get instructionStep1Title {
    return Intl.message(
      'Step 1: Getting Started',
      name: 'instructionStep1Title',
      desc: '',
      args: [],
    );
  }

  /// `Detailed explanation for the first step...`
  String get instructionStep1Text {
    return Intl.message(
      'Detailed explanation for the first step...',
      name: 'instructionStep1Text',
      desc: '',
      args: [],
    );
  }

  /// `Step 2: Configuration`
  String get instructionStep2Title {
    return Intl.message(
      'Step 2: Configuration',
      name: 'instructionStep2Title',
      desc: '',
      args: [],
    );
  }

  /// `Detailed explanation for the second step...`
  String get instructionStep2Text {
    return Intl.message(
      'Detailed explanation for the second step...',
      name: 'instructionStep2Text',
      desc: '',
      args: [],
    );
  }

  /// `Frequently Asked Questions`
  String get instructionFaqTitle {
    return Intl.message(
      'Frequently Asked Questions',
      name: 'instructionFaqTitle',
      desc: '',
      args: [],
    );
  }

  /// `Q1: How do I ...?`
  String get instructionFaqQ1 {
    return Intl.message(
      'Q1: How do I ...?',
      name: 'instructionFaqQ1',
      desc: '',
      args: [],
    );
  }

  /// `A1: You can ... by ...`
  String get instructionFaqA1 {
    return Intl.message(
      'A1: You can ... by ...',
      name: 'instructionFaqA1',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get instructionContactSupport {
    return Intl.message(
      'Contact Support',
      name: 'instructionContactSupport',
      desc: '',
      args: [],
    );
  }

  /// `Finances`
  String get financeScreenTitle {
    return Intl.message(
      'Finances',
      name: 'financeScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Current Balance:`
  String get financeBalanceLabel {
    return Intl.message(
      'Current Balance:',
      name: 'financeBalanceLabel',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get financeIncomeLabel {
    return Intl.message(
      'Income',
      name: 'financeIncomeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get financeExpensesLabel {
    return Intl.message(
      'Expenses',
      name: 'financeExpensesLabel',
      desc: '',
      args: [],
    );
  }

  /// `View Transactions`
  String get financeViewTransactionsButton {
    return Intl.message(
      'View Transactions',
      name: 'financeViewTransactionsButton',
      desc: '',
      args: [],
    );
  }

  /// `Add Transaction`
  String get financeAddTransactionButton {
    return Intl.message(
      'Add Transaction',
      name: 'financeAddTransactionButton',
      desc: '',
      args: [],
    );
  }

  /// `Transaction History`
  String get financeTransactionHistoryTitle {
    return Intl.message(
      'Transaction History',
      name: 'financeTransactionHistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `No transactions yet.`
  String get financeNoTransactions {
    return Intl.message(
      'No transactions yet.',
      name: 'financeNoTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Financial Report`
  String get financeReportTitle {
    return Intl.message(
      'Financial Report',
      name: 'financeReportTitle',
      desc: '',
      args: [],
    );
  }

  /// `Generate Report`
  String get financeGenerateReportButton {
    return Intl.message(
      'Generate Report',
      name: 'financeGenerateReportButton',
      desc: '',
      args: [],
    );
  }

  /// `STEM Zone`
  String get stemScreenTitle {
    return Intl.message(
      'STEM Zone',
      name: 'stemScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get stemScienceCategory {
    return Intl.message(
      'Science',
      name: 'stemScienceCategory',
      desc: '',
      args: [],
    );
  }

  /// `Technology`
  String get stemTechnologyCategory {
    return Intl.message(
      'Technology',
      name: 'stemTechnologyCategory',
      desc: '',
      args: [],
    );
  }

  /// `Engineering`
  String get stemEngineeringCategory {
    return Intl.message(
      'Engineering',
      name: 'stemEngineeringCategory',
      desc: '',
      args: [],
    );
  }

  /// `Mathematics`
  String get stemMathematicsCategory {
    return Intl.message(
      'Mathematics',
      name: 'stemMathematicsCategory',
      desc: '',
      args: [],
    );
  }

  /// `Explore Topic`
  String get stemExploreTopicButton {
    return Intl.message(
      'Explore Topic',
      name: 'stemExploreTopicButton',
      desc: '',
      args: [],
    );
  }

  /// `Learning Resources`
  String get stemLearningResources {
    return Intl.message(
      'Learning Resources',
      name: 'stemLearningResources',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get subpageDefaultTitle {
    return Intl.message(
      'Details',
      name: 'subpageDefaultTitle',
      desc: '',
      args: [],
    );
  }

  /// `Section Title`
  String get subpageSectionTitle {
    return Intl.message(
      'Section Title',
      name: 'subpageSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `More information will be displayed here.`
  String get subpageContentPlaceholder {
    return Intl.message(
      'More information will be displayed here.',
      name: 'subpageContentPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get subpageBackButton {
    return Intl.message('Back', name: 'subpageBackButton', desc: '', args: []);
  }

  /// `Data Table`
  String get tableScreenTitle {
    return Intl.message(
      'Data Table',
      name: 'tableScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Column 1`
  String get tableHeaderColumn1 {
    return Intl.message(
      'Column 1',
      name: 'tableHeaderColumn1',
      desc: '',
      args: [],
    );
  }

  /// `Column 2`
  String get tableHeaderColumn2 {
    return Intl.message(
      'Column 2',
      name: 'tableHeaderColumn2',
      desc: '',
      args: [],
    );
  }

  /// `Column 3`
  String get tableHeaderColumn3 {
    return Intl.message(
      'Column 3',
      name: 'tableHeaderColumn3',
      desc: '',
      args: [],
    );
  }

  /// `No data available to display.`
  String get tableNoData {
    return Intl.message(
      'No data available to display.',
      name: 'tableNoData',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get tablePreviousPage {
    return Intl.message(
      'Previous',
      name: 'tablePreviousPage',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get tableNextPage {
    return Intl.message('Next', name: 'tableNextPage', desc: '', args: []);
  }

  /// `Page {currentPage} of {totalPages}`
  String tablePageIndicator(Object currentPage, Object totalPages) {
    return Intl.message(
      'Page $currentPage of $totalPages',
      name: 'tablePageIndicator',
      desc: '',
      args: [currentPage, totalPages],
    );
  }

  /// `Verify Your Email`
  String get emailVerificationTitle {
    return Intl.message(
      'Verify Your Email',
      name: 'emailVerificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `A verification link has been sent to {userEmail}. Please check your inbox and click the link to verify your account.`
  String emailVerificationMessage(Object userEmail) {
    return Intl.message(
      'A verification link has been sent to $userEmail. Please check your inbox and click the link to verify your account.',
      name: 'emailVerificationMessage',
      desc: '',
      args: [userEmail],
    );
  }

  /// `Resend Verification Email`
  String get emailVerificationResendButton {
    return Intl.message(
      'Resend Verification Email',
      name: 'emailVerificationResendButton',
      desc: '',
      args: [],
    );
  }

  /// `A new verification email has been sent.`
  String get emailVerificationEmailSentMessage {
    return Intl.message(
      'A new verification email has been sent.',
      name: 'emailVerificationEmailSentMessage',
      desc: '',
      args: [],
    );
  }

  /// `If you don't see the email, please check your spam folder.`
  String get emailVerificationCheckSpam {
    return Intl.message(
      'If you don\'t see the email, please check your spam folder.',
      name: 'emailVerificationCheckSpam',
      desc: '',
      args: [],
    );
  }

  /// `Continue (after verification)`
  String get emailVerificationContinueButton {
    return Intl.message(
      'Continue (after verification)',
      name: 'emailVerificationContinueButton',
      desc: '',
      args: [],
    );
  }

  /// `Chat Support`
  String get chatbotScreenTitle {
    return Intl.message(
      'Chat Support',
      name: 'chatbotScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hello! How can I help you today?`
  String get chatbotWelcomeMessage {
    return Intl.message(
      'Hello! How can I help you today?',
      name: 'chatbotWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Type your message...`
  String get chatbotTypeMessageHint {
    return Intl.message(
      'Type your message...',
      name: 'chatbotTypeMessageHint',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get chatbotSendButtonTooltip {
    return Intl.message(
      'Send',
      name: 'chatbotSendButtonTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Thinking...`
  String get chatbotThinking {
    return Intl.message(
      'Thinking...',
      name: 'chatbotThinking',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, I couldn't understand that. Could you rephrase?`
  String get chatbotCouldNotUnderstand {
    return Intl.message(
      'Sorry, I couldn\'t understand that. Could you rephrase?',
      name: 'chatbotCouldNotUnderstand',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again later.`
  String get chatbotErrorOccurred {
    return Intl.message(
      'An error occurred. Please try again later.',
      name: 'chatbotErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get appBarNotificationsTooltip {
    return Intl.message(
      'Notifications',
      name: 'appBarNotificationsTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get appBarSearchTooltip {
    return Intl.message(
      'Search',
      name: 'appBarSearchTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get appBarSettingsTooltip {
    return Intl.message(
      'Settings',
      name: 'appBarSettingsTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get appBackTooltip {
    return Intl.message('Back', name: 'appBackTooltip', desc: '', args: []);
  }

  /// `View Details`
  String get cardViewDetailsButton {
    return Intl.message(
      'View Details',
      name: 'cardViewDetailsButton',
      desc: '',
      args: [],
    );
  }

  /// `Learn More`
  String get cardLearnMoreButton {
    return Intl.message(
      'Learn More',
      name: 'cardLearnMoreButton',
      desc: '',
      args: [],
    );
  }

  /// `Price:`
  String get cardPriceLabel {
    return Intl.message('Price:', name: 'cardPriceLabel', desc: '', args: []);
  }

  /// `Date:`
  String get cardDateLabel {
    return Intl.message('Date:', name: 'cardDateLabel', desc: '', args: []);
  }

  /// `Status:`
  String get cardStatusLabel {
    return Intl.message('Status:', name: 'cardStatusLabel', desc: '', args: []);
  }

  /// `Category:`
  String get cardCategoryLabel {
    return Intl.message(
      'Category:',
      name: 'cardCategoryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Author:`
  String get cardAuthorLabel {
    return Intl.message('Author:', name: 'cardAuthorLabel', desc: '', args: []);
  }

  /// `Published on:`
  String get cardPublishedOnLabel {
    return Intl.message(
      'Published on:',
      name: 'cardPublishedOnLabel',
      desc: '',
      args: [],
    );
  }

  /// `Yo, `
  String get mainScreenAppBarGreeting {
    return Intl.message(
      'Yo, ',
      name: 'mainScreenAppBarGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Account Logout`
  String get mainScreenLogoutDialogTitle {
    return Intl.message(
      'Account Logout',
      name: 'mainScreenLogoutDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get mainScreenLogoutDialogMessage {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'mainScreenLogoutDialogMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get mainScreenLogoutDialogCancelButton {
    return Intl.message(
      'Cancel',
      name: 'mainScreenLogoutDialogCancelButton',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get mainScreenLogoutDialogConfirmButton {
    return Intl.message(
      'Logout',
      name: 'mainScreenLogoutDialogConfirmButton',
      desc: '',
      args: [],
    );
  }

  /// `Farm`
  String get bottomNavFarm {
    return Intl.message('Farm', name: 'bottomNavFarm', desc: '', args: []);
  }

  /// `Shop`
  String get bottomNavShop {
    return Intl.message('Shop', name: 'bottomNavShop', desc: '', args: []);
  }

  /// `Messages`
  String get bottomNavMessages {
    return Intl.message(
      'Messages',
      name: 'bottomNavMessages',
      desc: '',
      args: [],
    );
  }

  /// `Feeds`
  String get bottomNavFeeds {
    return Intl.message('Feeds', name: 'bottomNavFeeds', desc: '', args: []);
  }

  /// `Feed Storage`
  String get storageTitle {
    return Intl.message(
      'Feed Storage',
      name: 'storageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameColumn {
    return Intl.message('Name', name: 'nameColumn', desc: '', args: []);
  }

  /// `Value`
  String get valueColumn {
    return Intl.message('Value', name: 'valueColumn', desc: '', args: []);
  }

  /// `Change Value`
  String get changeValue {
    return Intl.message(
      'Change Value',
      name: 'changeValue',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `{value} kg`
  String unitKg(Object value) {
    return Intl.message('$value kg', name: 'unitKg', desc: '', args: [value]);
  }

  /// `Oats`
  String get fieldOats {
    return Intl.message('Oats', name: 'fieldOats', desc: '', args: []);
  }

  /// `Corn`
  String get fieldCorns {
    return Intl.message('Corn', name: 'fieldCorns', desc: '', args: []);
  }

  /// `Silage`
  String get fieldSilages {
    return Intl.message('Silage', name: 'fieldSilages', desc: '', args: []);
  }

  /// `Straw`
  String get fieldStraws {
    return Intl.message('Straw', name: 'fieldStraws', desc: '', args: []);
  }

  /// `Peas`
  String get fieldPeas {
    return Intl.message('Peas', name: 'fieldPeas', desc: '', args: []);
  }

  /// `Herbs`
  String get fieldHerbs {
    return Intl.message('Herbs', name: 'fieldHerbs', desc: '', args: []);
  }

  /// `Hay`
  String get fieldHays {
    return Intl.message('Hay', name: 'fieldHays', desc: '', args: []);
  }

  /// `Log Out`
  String get logoutTitle {
    return Intl.message('Log Out', name: 'logoutTitle', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get logoutConfirmation {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message('Log Out', name: 'logout', desc: '', args: []);
  }

  /// `Create a password`
  String get createPasswordTitle {
    return Intl.message(
      'Create a password',
      name: 'createPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get enterNewPassword {
    return Intl.message(
      'Enter new password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get changePasswordButton {
    return Intl.message(
      'Change',
      name: 'changePasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get successTitle {
    return Intl.message('Success', name: 'successTitle', desc: '', args: []);
  }

  /// `Password changed successfully.`
  String get passwordChangedSuccess {
    return Intl.message(
      'Password changed successfully.',
      name: 'passwordChangedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification`
  String get appTitle {
    return Intl.message(
      'Email Verification',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email`
  String get checkYourEmail {
    return Intl.message(
      'Please check your email',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `I have confirmed`
  String get iHaveConfirmed {
    return Intl.message(
      'I have confirmed',
      name: 'iHaveConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Resend verification email`
  String get resendVerification {
    return Intl.message(
      'Resend verification email',
      name: 'resendVerification',
      desc: '',
      args: [],
    );
  }

  /// `Verification email sent again`
  String get emailSentAgain {
    return Intl.message(
      'Verification email sent again',
      name: 'emailSentAgain',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your email`
  String get confirmYourEmail {
    return Intl.message(
      'Confirm your email',
      name: 'confirmYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Send Email`
  String get sendEmailButton {
    return Intl.message(
      'Send Email',
      name: 'sendEmailButton',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email.`
  String get emailIsEmptyError {
    return Intl.message(
      'Please enter your email.',
      name: 'emailIsEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Email has been sent.`
  String get emailSentSuccess {
    return Intl.message(
      'Email has been sent.',
      name: 'emailSentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get okButton {
    return Intl.message('OK', name: 'okButton', desc: '', args: []);
  }

  /// `Yo, {username}`
  String greeting(Object username) {
    return Intl.message(
      'Yo, $username',
      name: 'greeting',
      desc: '',
      args: [username],
    );
  }

  /// `Greeting with username`
  String get greetingDescription {
    return Intl.message(
      'Greeting with username',
      name: 'greetingDescription',
      desc: '',
      args: [],
    );
  }

  /// `This email is already registered.`
  String get emailAlreadyRegistered {
    return Intl.message(
      'This email is already registered.',
      name: 'emailAlreadyRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation sent to {email}.`
  String confirmationSent(Object email) {
    return Intl.message(
      'Confirmation sent to $email.',
      name: 'confirmationSent',
      desc: '',
      args: [email],
    );
  }

  /// `Error: Current user not found.`
  String get userNotFoundError {
    return Intl.message(
      'Error: Current user not found.',
      name: 'userNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `Error sending confirmation: {error}`
  String confirmationSendError(Object error) {
    return Intl.message(
      'Error sending confirmation: $error',
      name: 'confirmationSendError',
      desc: '',
      args: [error],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message('Email', name: 'emailLabel', desc: '', args: []);
  }

  /// `Confirm`
  String get confirmButton {
    return Intl.message('Confirm', name: 'confirmButton', desc: '', args: []);
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Add Animal`
  String get addAnimal {
    return Intl.message('Add Animal', name: 'addAnimal', desc: '', args: []);
  }

  /// `Tag Number`
  String get tagNumber {
    return Intl.message('Tag Number', name: 'tagNumber', desc: '', args: []);
  }

  /// `Enter tag number`
  String get enterTagNumber {
    return Intl.message(
      'Enter tag number',
      name: 'enterTagNumber',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Enter gender`
  String get enterGender {
    return Intl.message(
      'Enter gender',
      name: 'enterGender',
      desc: '',
      args: [],
    );
  }

  /// `Breed`
  String get breed {
    return Intl.message('Breed', name: 'breed', desc: '', args: []);
  }

  /// `Select breed`
  String get selectBreed {
    return Intl.message(
      'Select breed',
      name: 'selectBreed',
      desc: '',
      args: [],
    );
  }

  /// `Birth Date`
  String get birthDate {
    return Intl.message('Birth Date', name: 'birthDate', desc: '', args: []);
  }

  /// `Select birth date`
  String get selectBirthDate {
    return Intl.message(
      'Select birth date',
      name: 'selectBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `Weight (kg)`
  String get weight {
    return Intl.message('Weight (kg)', name: 'weight', desc: '', args: []);
  }

  /// `Enter weight`
  String get enterWeight {
    return Intl.message(
      'Enter weight',
      name: 'enterWeight',
      desc: '',
      args: [],
    );
  }

  /// `Health Status`
  String get healthStatus {
    return Intl.message(
      'Health Status',
      name: 'healthStatus',
      desc: '',
      args: [],
    );
  }

  /// `Select health status`
  String get selectHealthStatus {
    return Intl.message(
      'Select health status',
      name: 'selectHealthStatus',
      desc: '',
      args: [],
    );
  }

  /// `Medical Card`
  String get medicalCard {
    return Intl.message(
      'Medical Card',
      name: 'medicalCard',
      desc: '',
      args: [],
    );
  }

  /// `Enter medical card`
  String get enterMedicalCard {
    return Intl.message(
      'Enter medical card',
      name: 'enterMedicalCard',
      desc: '',
      args: [],
    );
  }

  /// `Add Animal`
  String get addAnimalButton {
    return Intl.message(
      'Add Animal',
      name: 'addAnimalButton',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all fields`
  String get fillAllFields {
    return Intl.message(
      'Please fill in all fields',
      name: 'fillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Animal added successfully`
  String get animalAddedSuccessfully {
    return Intl.message(
      'Animal added successfully',
      name: 'animalAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error while adding animal`
  String get errorAddingAnimal {
    return Intl.message(
      'Error while adding animal',
      name: 'errorAddingAnimal',
      desc: '',
      args: [],
    );
  }

  /// `User not authorized`
  String get userNotAuthorized {
    return Intl.message(
      'User not authorized',
      name: 'userNotAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `Herd not found`
  String get herdNotFound {
    return Intl.message(
      'Herd not found',
      name: 'herdNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Herd cattle type not specified`
  String get herdCattleTypeNotSpecified {
    return Intl.message(
      'Herd cattle type not specified',
      name: 'herdCattleTypeNotSpecified',
      desc: '',
      args: [],
    );
  }

  /// `Error loading breeds`
  String get errorLoadingBreeds {
    return Intl.message(
      'Error loading breeds',
      name: 'errorLoadingBreeds',
      desc: '',
      args: [],
    );
  }

  /// `Error loading health statuses`
  String get errorLoadingHealthStatuses {
    return Intl.message(
      'Error loading health statuses',
      name: 'errorLoadingHealthStatuses',
      desc: '',
      args: [],
    );
  }

  /// `Create Herd`
  String get createStado {
    return Intl.message('Create Herd', name: 'createStado', desc: '', args: []);
  }

  /// `Herd Number`
  String get stadoNumber {
    return Intl.message('Herd Number', name: 'stadoNumber', desc: '', args: []);
  }

  /// `Enter a unique herd number`
  String get enterStadoNumber {
    return Intl.message(
      'Enter a unique herd number',
      name: 'enterStadoNumber',
      desc: '',
      args: [],
    );
  }

  /// `Select cattle type`
  String get selectCattleType {
    return Intl.message(
      'Select cattle type',
      name: 'selectCattleType',
      desc: '',
      args: [],
    );
  }

  /// `Cattle Type`
  String get cattleType {
    return Intl.message('Cattle Type', name: 'cattleType', desc: '', args: []);
  }

  /// `Saving...`
  String get saving {
    return Intl.message('Saving...', name: 'saving', desc: '', args: []);
  }

  /// `Please fill all fields`
  String get fieldRequired {
    return Intl.message(
      'Please fill all fields',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Herd created successfully!`
  String get stadoCreated {
    return Intl.message(
      'Herd created successfully!',
      name: 'stadoCreated',
      desc: '',
      args: [],
    );
  }

  /// `Error creating herd`
  String get createHerdError {
    return Intl.message(
      'Error creating herd',
      name: 'createHerdError',
      desc: '',
      args: [],
    );
  }

  /// `Table`
  String get table {
    return Intl.message('Table', name: 'table', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Passport`
  String get techPassport {
    return Intl.message('Passport', name: 'techPassport', desc: '', args: []);
  }

  /// `Technical passport`
  String get techPassportHeader {
    return Intl.message(
      'Technical passport',
      name: 'techPassportHeader',
      desc: '',
      args: [],
    );
  }

  /// `herd {stadoName}`
  String herdTitle(Object stadoName) {
    return Intl.message(
      'herd $stadoName',
      name: 'herdTitle',
      desc: '',
      args: [stadoName],
    );
  }

  /// `How to use`
  String get instructionTitle {
    return Intl.message(
      'How to use',
      name: 'instructionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get instructionCardIntroductionTitle {
    return Intl.message(
      'Introduction',
      name: 'instructionCardIntroductionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description of how to get started with the app.`
  String get instructionCardIntroductionDescription {
    return Intl.message(
      'Description of how to get started with the app.',
      name: 'instructionCardIntroductionDescription',
      desc: '',
      args: [],
    );
  }

  /// `Main Screen`
  String get instructionCardMainScreenTitle {
    return Intl.message(
      'Main Screen',
      name: 'instructionCardMainScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description of the main screen and features.`
  String get instructionCardMainScreenDescription {
    return Intl.message(
      'Description of the main screen and features.',
      name: 'instructionCardMainScreenDescription',
      desc: '',
      args: [],
    );
  }

  /// `Adding Cattle`
  String get instructionCardAddCattleTitle {
    return Intl.message(
      'Adding Cattle',
      name: 'instructionCardAddCattleTitle',
      desc: '',
      args: [],
    );
  }

  /// `How to add cattle to the system.`
  String get instructionCardAddCattleDescription {
    return Intl.message(
      'How to add cattle to the system.',
      name: 'instructionCardAddCattleDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tech Passport / Adding`
  String get instructionCardTechPassportTitle {
    return Intl.message(
      'Tech Passport / Adding',
      name: 'instructionCardTechPassportTitle',
      desc: '',
      args: [],
    );
  }

  /// `How to add the animal's tech passport.`
  String get instructionCardTechPassportDescription {
    return Intl.message(
      'How to add the animal\'s tech passport.',
      name: 'instructionCardTechPassportDescription',
      desc: '',
      args: [],
    );
  }

  /// `Animals Table`
  String get instructionCardAnimalsTableTitle {
    return Intl.message(
      'Animals Table',
      name: 'instructionCardAnimalsTableTitle',
      desc: '',
      args: [],
    );
  }

  /// `How to track animals in the table.`
  String get instructionCardAnimalsTableDescription {
    return Intl.message(
      'How to track animals in the table.',
      name: 'instructionCardAnimalsTableDescription',
      desc: '',
      args: [],
    );
  }

  /// `Chat Bot`
  String get instructionCardChatBotTitle {
    return Intl.message(
      'Chat Bot',
      name: 'instructionCardChatBotTitle',
      desc: '',
      args: [],
    );
  }

  /// `How to use the chat bot for communication.`
  String get instructionCardChatBotDescription {
    return Intl.message(
      'How to use the chat bot for communication.',
      name: 'instructionCardChatBotDescription',
      desc: '',
      args: [],
    );
  }

  /// `Feed Warehouse`
  String get instructionCardFeedWarehouseTitle {
    return Intl.message(
      'Feed Warehouse',
      name: 'instructionCardFeedWarehouseTitle',
      desc: '',
      args: [],
    );
  }

  /// `How to add feed to the warehouse.`
  String get instructionCardFeedWarehouseDescription {
    return Intl.message(
      'How to add feed to the warehouse.',
      name: 'instructionCardFeedWarehouseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Weight Tracking`
  String get instructionCardWeightTrackingTitle {
    return Intl.message(
      'Weight Tracking',
      name: 'instructionCardWeightTrackingTitle',
      desc: '',
      args: [],
    );
  }

  /// `How to track changes in animal weight.`
  String get instructionCardWeightTrackingDescription {
    return Intl.message(
      'How to track changes in animal weight.',
      name: 'instructionCardWeightTrackingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Duration: `
  String get instructionCardDurationLabel {
    return Intl.message(
      'Duration: ',
      name: 'instructionCardDurationLabel',
      desc: '',
      args: [],
    );
  }

  /// `15 minutes`
  String get duration15min {
    return Intl.message(
      '15 minutes',
      name: 'duration15min',
      desc: '',
      args: [],
    );
  }

  /// `20 minutes`
  String get duration20min {
    return Intl.message(
      '20 minutes',
      name: 'duration20min',
      desc: '',
      args: [],
    );
  }

  /// `5 minutes`
  String get duration5min {
    return Intl.message('5 minutes', name: 'duration5min', desc: '', args: []);
  }

  /// `4 minutes`
  String get duration4min {
    return Intl.message('4 minutes', name: 'duration4min', desc: '', args: []);
  }

  /// `CYCLONE — your digital assistant in farm management`
  String get introTitle {
    return Intl.message(
      'CYCLONE — your digital assistant in farm management',
      name: 'introTitle',
      desc: '',
      args: [],
    );
  }

  /// `CYCLONE is an app that helps farmers simplify feeding management, track livestock growth, and monitor supplies. Everything in one place, without paperwork hassle.`
  String get dividerDescription {
    return Intl.message(
      'CYCLONE is an app that helps farmers simplify feeding management, track livestock growth, and monitor supplies. Everything in one place, without paperwork hassle.',
      name: 'dividerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Where to start?`
  String get startQuestion {
    return Intl.message(
      'Where to start?',
      name: 'startQuestion',
      desc: '',
      args: [],
    );
  }

  /// `1. Choose the interface language — Russian or English.`
  String get bullet1 {
    return Intl.message(
      '1. Choose the interface language — Russian or English.',
      name: 'bullet1',
      desc: '',
      args: [],
    );
  }

  /// `2. Register using your email and password.`
  String get bullet2 {
    return Intl.message(
      '2. Register using your email and password.',
      name: 'bullet2',
      desc: '',
      args: [],
    );
  }

  /// `3. Or sign in with your Google account — quick and convenient.`
  String get bullet3 {
    return Intl.message(
      '3. Or sign in with your Google account — quick and convenient.',
      name: 'bullet3',
      desc: '',
      args: [],
    );
  }

  /// `4. After logging in, you'll reach the main dashboard where you can start working: add data, monitor statistics, and get analytics.`
  String get bullet4 {
    return Intl.message(
      '4. After logging in, you\'ll reach the main dashboard where you can start working: add data, monitor statistics, and get analytics.',
      name: 'bullet4',
      desc: '',
      args: [],
    );
  }

  /// `CYCLONE makes farming understandable, efficient, and modern. All management is at your fingertips.`
  String get closingStatement {
    return Intl.message(
      'CYCLONE makes farming understandable, efficient, and modern. All management is at your fingertips.',
      name: 'closingStatement',
      desc: '',
      args: [],
    );
  }

  /// `Finance`
  String get financeTitle {
    return Intl.message('Finance', name: 'financeTitle', desc: '', args: []);
  }

  /// `Change Card`
  String get changeCard {
    return Intl.message('Change Card', name: 'changeCard', desc: '', args: []);
  }

  /// `Delete Card`
  String get deleteCard {
    return Intl.message('Delete Card', name: 'deleteCard', desc: '', args: []);
  }

  /// `Add Card`
  String get addingTitle {
    return Intl.message('Add Card', name: 'addingTitle', desc: '', args: []);
  }

  /// `Card Name`
  String get cardNameLabel {
    return Intl.message('Card Name', name: 'cardNameLabel', desc: '', args: []);
  }

  /// `Name`
  String get cardNameHint {
    return Intl.message('Name', name: 'cardNameHint', desc: '', args: []);
  }

  /// `Card Number`
  String get cardNumberLabel {
    return Intl.message(
      'Card Number',
      name: 'cardNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `XXXX   XXXX   XXXX   XXXX`
  String get cardNumberHint {
    return Intl.message(
      'XXXX   XXXX   XXXX   XXXX',
      name: 'cardNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get expiryDateLabel {
    return Intl.message(
      'Expiry Date',
      name: 'expiryDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `MM/YY`
  String get expiryDateHint {
    return Intl.message('MM/YY', name: 'expiryDateHint', desc: '', args: []);
  }

  /// `Security Code`
  String get cvvLabel {
    return Intl.message('Security Code', name: 'cvvLabel', desc: '', args: []);
  }

  /// `CVV`
  String get cvvHint {
    return Intl.message('CVV', name: 'cvvHint', desc: '', args: []);
  }

  /// `Postal Code`
  String get postalCodeLabel {
    return Intl.message(
      'Postal Code',
      name: 'postalCodeLabel',
      desc: '',
      args: [],
    );
  }

  /// `XXXX`
  String get postalCodeHint {
    return Intl.message('XXXX', name: 'postalCodeHint', desc: '', args: []);
  }

  /// `Add`
  String get addButton {
    return Intl.message('Add', name: 'addButton', desc: '', args: []);
  }

  /// `Feed Table`
  String get tableTitle {
    return Intl.message('Feed Table', name: 'tableTitle', desc: '', args: []);
  }

  /// `herd`
  String get herd {
    return Intl.message('herd', name: 'herd', desc: '', args: []);
  }

  /// `feed unit`
  String get feedUnit {
    return Intl.message('feed unit', name: 'feedUnit', desc: '', args: []);
  }

  /// `kg`
  String get kg {
    return Intl.message('kg', name: 'kg', desc: '', args: []);
  }

  /// `Edit {feedName}`
  String editDialog_title(Object feedName) {
    return Intl.message(
      'Edit $feedName',
      name: 'editDialog_title',
      desc: '',
      args: [feedName],
    );
  }

  /// `Enter new value`
  String get editDialog_label {
    return Intl.message(
      'Enter new value',
      name: 'editDialog_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter a number`
  String get editDialog_hint {
    return Intl.message(
      'Enter a number',
      name: 'editDialog_hint',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get editDialog_cancel {
    return Intl.message(
      'Cancel',
      name: 'editDialog_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get editDialog_save {
    return Intl.message('Save', name: 'editDialog_save', desc: '', args: []);
  }

  /// `Please enter a valid number`
  String get editDialog_invalidNumber {
    return Intl.message(
      'Please enter a valid number',
      name: 'editDialog_invalidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Storage not found`
  String get editDialog_noStorage {
    return Intl.message(
      'Storage not found',
      name: 'editDialog_noStorage',
      desc: '',
      args: [],
    );
  }

  /// `Not enough feed in storage`
  String get editDialog_insufficientFeed {
    return Intl.message(
      'Not enough feed in storage',
      name: 'editDialog_insufficientFeed',
      desc: '',
      args: [],
    );
  }

  /// `Error saving data`
  String get editDialog_saveError {
    return Intl.message(
      'Error saving data',
      name: 'editDialog_saveError',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get ageLabel {
    return Intl.message('Age', name: 'ageLabel', desc: '', args: []);
  }

  /// `Weight`
  String get weightLabel {
    return Intl.message('Weight', name: 'weightLabel', desc: '', args: []);
  }

  /// `Breed`
  String get breedLabel {
    return Intl.message('Breed', name: 'breedLabel', desc: '', args: []);
  }

  /// `Health`
  String get healthLabel {
    return Intl.message('Health', name: 'healthLabel', desc: '', args: []);
  }

  /// `Good`
  String get healthGood {
    return Intl.message('Good', name: 'healthGood', desc: '', args: []);
  }

  /// `Medium`
  String get healthMedium {
    return Intl.message('Medium', name: 'healthMedium', desc: '', args: []);
  }

  /// `Poor`
  String get healthPoor {
    return Intl.message('Poor', name: 'healthPoor', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ky'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
