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

  /// `———— Or sign in with ————`
  String get loginOrSignInWith {
    return Intl.message(
      '———— Or sign in with ————',
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
