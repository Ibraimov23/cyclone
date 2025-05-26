// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(error) => "Error sending confirmation: ${error}";

  static String m1(email) => "Confirmation sent to ${email}.";

  static String m2(feedName) => "Delete feed \"${feedName}\"?";

  static String m3(feedName) => "Edit ${feedName}";

  static String m4(userEmail) =>
      "A verification link has been sent to ${userEmail}. Please check your inbox and click the link to verify your account.";

  static String m5(username) => "Yo, ${username}";

  static String m6(stadoName) => "herd ${stadoName}";

  static String m7(userName) => "Hello, ${userName}!";

  static String m8(currentPage, totalPages) =>
      "Page ${currentPage} of ${totalPages}";

  static String m9(value) => "${value} kg";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accountAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "This email is already registered. Try to login.",
    ),
    "accountAlreadyExistsTitle": MessageLookupByLibrary.simpleMessage(
      "Account already exists",
    ),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addAnimal": MessageLookupByLibrary.simpleMessage("Add Animal"),
    "addAnimalButton": MessageLookupByLibrary.simpleMessage("Add Animal"),
    "addButton": MessageLookupByLibrary.simpleMessage("Add"),
    "addItemButton": MessageLookupByLibrary.simpleMessage("Add Item"),
    "addNewFeedTitle": MessageLookupByLibrary.simpleMessage("Add new feed"),
    "addRecordButton": MessageLookupByLibrary.simpleMessage("Add Record"),
    "addScreenTitle": MessageLookupByLibrary.simpleMessage("Add New Item"),
    "addVaccinationButton": MessageLookupByLibrary.simpleMessage(
      "Add Vaccination Record",
    ),
    "addingTitle": MessageLookupByLibrary.simpleMessage("Add Card"),
    "ageLabel": MessageLookupByLibrary.simpleMessage("Age"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "animalAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Animal added successfully",
    ),
    "animalBreedLabel": MessageLookupByLibrary.simpleMessage("Breed"),
    "animalDateOfBirthLabel": MessageLookupByLibrary.simpleMessage(
      "Date of Birth",
    ),
    "animalMicrochipIdLabel": MessageLookupByLibrary.simpleMessage(
      "Microchip ID",
    ),
    "animalNameLabel": MessageLookupByLibrary.simpleMessage("Animal Name"),
    "animalOwnerLabel": MessageLookupByLibrary.simpleMessage("Owner"),
    "animalPassportTitle": MessageLookupByLibrary.simpleMessage(
      "Animal Passport",
    ),
    "animalSpeciesLabel": MessageLookupByLibrary.simpleMessage("Species"),
    "animalVaccinationsTitle": MessageLookupByLibrary.simpleMessage(
      "Vaccinations",
    ),
    "appBackTooltip": MessageLookupByLibrary.simpleMessage("Back"),
    "appBarNotificationsTooltip": MessageLookupByLibrary.simpleMessage(
      "Notifications",
    ),
    "appBarSearchTooltip": MessageLookupByLibrary.simpleMessage("Search"),
    "appBarSettingsTooltip": MessageLookupByLibrary.simpleMessage("Settings"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Email Verification"),
    "birthDate": MessageLookupByLibrary.simpleMessage("Birth Date"),
    "bottomNavFarm": MessageLookupByLibrary.simpleMessage("Farm"),
    "bottomNavFeeds": MessageLookupByLibrary.simpleMessage("Feeds"),
    "bottomNavMessages": MessageLookupByLibrary.simpleMessage("Messages"),
    "bottomNavShop": MessageLookupByLibrary.simpleMessage("Shop"),
    "breed": MessageLookupByLibrary.simpleMessage("Breed"),
    "breedAlpine": MessageLookupByLibrary.simpleMessage("Alpine"),
    "breedAngus": MessageLookupByLibrary.simpleMessage("Angus"),
    "breedAyrshire": MessageLookupByLibrary.simpleMessage("Ayrshire"),
    "breedBlackPied": MessageLookupByLibrary.simpleMessage("Black Pied"),
    "breedBoer": MessageLookupByLibrary.simpleMessage("Boer"),
    "breedCharolais": MessageLookupByLibrary.simpleMessage("Charolais"),
    "breedDorper": MessageLookupByLibrary.simpleMessage("Dorper"),
    "breedHereford": MessageLookupByLibrary.simpleMessage("Hereford"),
    "breedHerefordWhitehead": MessageLookupByLibrary.simpleMessage(
      "Hereford Whitehead",
    ),
    "breedHolstein": MessageLookupByLibrary.simpleMessage("Holstein"),
    "breedJersey": MessageLookupByLibrary.simpleMessage("Jersey"),
    "breedLabel": MessageLookupByLibrary.simpleMessage("Breed"),
    "breedLimousin": MessageLookupByLibrary.simpleMessage("Limousin"),
    "breedMerino": MessageLookupByLibrary.simpleMessage("Merino"),
    "breedNubian": MessageLookupByLibrary.simpleMessage("Nubian"),
    "breedPrecos": MessageLookupByLibrary.simpleMessage("Precos"),
    "breedRomanov": MessageLookupByLibrary.simpleMessage("Romanov"),
    "breedSaanen": MessageLookupByLibrary.simpleMessage("Saanen"),
    "breedSimmental": MessageLookupByLibrary.simpleMessage("Simmental"),
    "breedTexel": MessageLookupByLibrary.simpleMessage("Texel"),
    "breedToggenburg": MessageLookupByLibrary.simpleMessage("Toggenburg"),
    "bull": MessageLookupByLibrary.simpleMessage("Bulls"),
    "bullet1": MessageLookupByLibrary.simpleMessage(
      "1. Choose the interface language — Russian or English.",
    ),
    "bullet2": MessageLookupByLibrary.simpleMessage(
      "2. Register using your email and password.",
    ),
    "bullet3": MessageLookupByLibrary.simpleMessage(
      "3. Or sign in with your Google account — quick and convenient.",
    ),
    "bullet4": MessageLookupByLibrary.simpleMessage(
      "4. After logging in, you\'ll reach the main dashboard where you can start working: add data, monitor statistics, and get analytics.",
    ),
    "bulls": MessageLookupByLibrary.simpleMessage("Bulls"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cardAuthorLabel": MessageLookupByLibrary.simpleMessage("Author:"),
    "cardCategoryLabel": MessageLookupByLibrary.simpleMessage("Category:"),
    "cardDateLabel": MessageLookupByLibrary.simpleMessage("Date:"),
    "cardLearnMoreButton": MessageLookupByLibrary.simpleMessage("Learn More"),
    "cardNameHint": MessageLookupByLibrary.simpleMessage("Name"),
    "cardNameLabel": MessageLookupByLibrary.simpleMessage("Card Name"),
    "cardNumberHint": MessageLookupByLibrary.simpleMessage(
      "XXXX   XXXX   XXXX   XXXX",
    ),
    "cardNumberLabel": MessageLookupByLibrary.simpleMessage("Card Number"),
    "cardPriceLabel": MessageLookupByLibrary.simpleMessage("Price:"),
    "cardPublishedOnLabel": MessageLookupByLibrary.simpleMessage(
      "Published on:",
    ),
    "cardStatusLabel": MessageLookupByLibrary.simpleMessage("Status:"),
    "cardViewDetailsButton": MessageLookupByLibrary.simpleMessage(
      "View Details",
    ),
    "cattleType": MessageLookupByLibrary.simpleMessage("Cattle Type"),
    "changeCard": MessageLookupByLibrary.simpleMessage("Change Card"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change Password"),
    "changePasswordButton": MessageLookupByLibrary.simpleMessage("Change"),
    "changeValue": MessageLookupByLibrary.simpleMessage("Change Value"),
    "chatbotCouldNotUnderstand": MessageLookupByLibrary.simpleMessage(
      "Sorry, I couldn\'t understand that. Could you rephrase?",
    ),
    "chatbotErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "An error occurred. Please try again later.",
    ),
    "chatbotScreenTitle": MessageLookupByLibrary.simpleMessage("Chat Support"),
    "chatbotSendButtonTooltip": MessageLookupByLibrary.simpleMessage("Send"),
    "chatbotThinking": MessageLookupByLibrary.simpleMessage("Thinking..."),
    "chatbotTypeMessageHint": MessageLookupByLibrary.simpleMessage(
      "Type your message...",
    ),
    "chatbotWelcomeMessage": MessageLookupByLibrary.simpleMessage(
      "Hello! How can I help you today?",
    ),
    "checkYourEmail": MessageLookupByLibrary.simpleMessage(
      "Please check your email",
    ),
    "closingStatement": MessageLookupByLibrary.simpleMessage(
      "CYCLONE makes farming understandable, efficient, and modern. All management is at your fingertips.",
    ),
    "confirmButton": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmEditButton": MessageLookupByLibrary.simpleMessage("Edit"),
    "confirmMessage": MessageLookupByLibrary.simpleMessage(
      "Please review the details before submitting.",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm password"),
    "confirmScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Confirm Details",
    ),
    "confirmSubmitButton": MessageLookupByLibrary.simpleMessage("Submit"),
    "confirmYourEmail": MessageLookupByLibrary.simpleMessage(
      "Confirm your email",
    ),
    "confirmationSendError": m0,
    "confirmationSent": m1,
    "cow": MessageLookupByLibrary.simpleMessage("Cows"),
    "cows": MessageLookupByLibrary.simpleMessage("Cows"),
    "createHerdError": MessageLookupByLibrary.simpleMessage(
      "Error creating herd",
    ),
    "createItemTitle": MessageLookupByLibrary.simpleMessage("Create New Item"),
    "createNewButton": MessageLookupByLibrary.simpleMessage("Create New"),
    "createPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Create a password",
    ),
    "createStado": MessageLookupByLibrary.simpleMessage("Create Herd"),
    "cvvHint": MessageLookupByLibrary.simpleMessage("CVV"),
    "cvvLabel": MessageLookupByLibrary.simpleMessage("Security Code"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteCard": MessageLookupByLibrary.simpleMessage("Delete Card"),
    "deleteFeedConfirmation": m2,
    "detailsCattleCount": MessageLookupByLibrary.simpleMessage("Count"),
    "detailsCattleName": MessageLookupByLibrary.simpleMessage("Cattle Name"),
    "detailsCattleType": MessageLookupByLibrary.simpleMessage("Cattle Type"),
    "detailsTitle": MessageLookupByLibrary.simpleMessage("Cattle Details"),
    "dividerDescription": MessageLookupByLibrary.simpleMessage(
      "CYCLONE is an app that helps farmers simplify feeding management, track livestock growth, and monitor supplies. Everything in one place, without paperwork hassle.",
    ),
    "drawerAbout": MessageLookupByLibrary.simpleMessage("About Us"),
    "drawerAddAccount": MessageLookupByLibrary.simpleMessage("Add Account"),
    "drawerHome": MessageLookupByLibrary.simpleMessage("Home"),
    "drawerInstructions": MessageLookupByLibrary.simpleMessage("Instructions"),
    "drawerLanguage": MessageLookupByLibrary.simpleMessage("Language"),
    "drawerLogout": MessageLookupByLibrary.simpleMessage("Logout"),
    "drawerProfile": MessageLookupByLibrary.simpleMessage("Profile"),
    "drawerSettings": MessageLookupByLibrary.simpleMessage("Settings"),
    "drawerShop": MessageLookupByLibrary.simpleMessage("Shop"),
    "drawerSoon": MessageLookupByLibrary.simpleMessage("Coming soon"),
    "drawerStats": MessageLookupByLibrary.simpleMessage("Statistics"),
    "drawerSubscription": MessageLookupByLibrary.simpleMessage("Subscription"),
    "duration15min": MessageLookupByLibrary.simpleMessage("15 minutes"),
    "duration20min": MessageLookupByLibrary.simpleMessage("20 minutes"),
    "duration4min": MessageLookupByLibrary.simpleMessage("4 minutes"),
    "duration5min": MessageLookupByLibrary.simpleMessage("5 minutes"),
    "editDialog_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "editDialog_hint": MessageLookupByLibrary.simpleMessage("Enter a number"),
    "editDialog_insufficientFeed": MessageLookupByLibrary.simpleMessage(
      "Not enough feed in storage",
    ),
    "editDialog_invalidNumber": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid number",
    ),
    "editDialog_label": MessageLookupByLibrary.simpleMessage("Enter new value"),
    "editDialog_noStorage": MessageLookupByLibrary.simpleMessage(
      "Storage not found",
    ),
    "editDialog_save": MessageLookupByLibrary.simpleMessage("Save"),
    "editDialog_saveError": MessageLookupByLibrary.simpleMessage(
      "Error saving data",
    ),
    "editDialog_title": m3,
    "emailAlreadyRegistered": MessageLookupByLibrary.simpleMessage(
      "This email is already registered.",
    ),
    "emailIsEmptyError": MessageLookupByLibrary.simpleMessage(
      "Please enter your email.",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "emailSentAgain": MessageLookupByLibrary.simpleMessage(
      "Verification email sent again",
    ),
    "emailSentMessage": MessageLookupByLibrary.simpleMessage(
      "A confirmation email has been sent to your address.",
    ),
    "emailSentSuccess": MessageLookupByLibrary.simpleMessage(
      "Email has been sent.",
    ),
    "emailSentTitle": MessageLookupByLibrary.simpleMessage("Email sent"),
    "emailVerificationCheckSpam": MessageLookupByLibrary.simpleMessage(
      "If you don\'t see the email, please check your spam folder.",
    ),
    "emailVerificationContinueButton": MessageLookupByLibrary.simpleMessage(
      "Continue (after verification)",
    ),
    "emailVerificationEmailSentMessage": MessageLookupByLibrary.simpleMessage(
      "A new verification email has been sent.",
    ),
    "emailVerificationMessage": m4,
    "emailVerificationResendButton": MessageLookupByLibrary.simpleMessage(
      "Resend Verification Email",
    ),
    "emailVerificationTitle": MessageLookupByLibrary.simpleMessage(
      "Verify Your Email",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enterGender": MessageLookupByLibrary.simpleMessage("Enter gender"),
    "enterIdHint": MessageLookupByLibrary.simpleMessage("Scan or type ID"),
    "enterIdLabel": MessageLookupByLibrary.simpleMessage("Enter ID"),
    "enterMedicalCard": MessageLookupByLibrary.simpleMessage(
      "Enter medical card",
    ),
    "enterNewPassword": MessageLookupByLibrary.simpleMessage(
      "Enter new password",
    ),
    "enterPassword": MessageLookupByLibrary.simpleMessage("Enter password"),
    "enterStadoNumber": MessageLookupByLibrary.simpleMessage(
      "Enter a unique herd number",
    ),
    "enterTagNumber": MessageLookupByLibrary.simpleMessage("Enter tag number"),
    "enterWeight": MessageLookupByLibrary.simpleMessage("Enter weight"),
    "enterYourEmail": MessageLookupByLibrary.simpleMessage("Enter your email"),
    "errorAddingAnimal": MessageLookupByLibrary.simpleMessage(
      "Error while adding animal",
    ),
    "errorAuthentication": MessageLookupByLibrary.simpleMessage(
      "Authentication error",
    ),
    "errorLoadingBreeds": MessageLookupByLibrary.simpleMessage(
      "Error loading breeds",
    ),
    "errorLoadingHealthStatuses": MessageLookupByLibrary.simpleMessage(
      "Error loading health statuses",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Error"),
    "expiryDateHint": MessageLookupByLibrary.simpleMessage("MM/YY"),
    "expiryDateLabel": MessageLookupByLibrary.simpleMessage("Expiry Date"),
    "feedNameHint": MessageLookupByLibrary.simpleMessage("Feed name"),
    "feedSubtitle": MessageLookupByLibrary.simpleMessage(
      "From 1500 soms per sack.",
    ),
    "feedTitle": MessageLookupByLibrary.simpleMessage(
      "Premium quality livestock feed!",
    ),
    "feedUnit": MessageLookupByLibrary.simpleMessage("feed unit"),
    "feedUnitHint": MessageLookupByLibrary.simpleMessage("Feed unit per 1 kg"),
    "feedValueHint": MessageLookupByLibrary.simpleMessage("Feed value"),
    "fieldCorns": MessageLookupByLibrary.simpleMessage("Corn"),
    "fieldHays": MessageLookupByLibrary.simpleMessage("Hay"),
    "fieldHerbs": MessageLookupByLibrary.simpleMessage("Herbs"),
    "fieldOats": MessageLookupByLibrary.simpleMessage("Oats"),
    "fieldPeas": MessageLookupByLibrary.simpleMessage("Peas"),
    "fieldRequired": MessageLookupByLibrary.simpleMessage(
      "Please fill all fields",
    ),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "fieldSilages": MessageLookupByLibrary.simpleMessage("Silage"),
    "fieldStraws": MessageLookupByLibrary.simpleMessage("Straw"),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Please fill in all fields",
    ),
    "financeAddTransactionButton": MessageLookupByLibrary.simpleMessage(
      "Add Transaction",
    ),
    "financeBalanceLabel": MessageLookupByLibrary.simpleMessage(
      "Current Balance:",
    ),
    "financeExpensesLabel": MessageLookupByLibrary.simpleMessage("Expenses"),
    "financeGenerateReportButton": MessageLookupByLibrary.simpleMessage(
      "Generate Report",
    ),
    "financeIncomeLabel": MessageLookupByLibrary.simpleMessage("Income"),
    "financeNoTransactions": MessageLookupByLibrary.simpleMessage(
      "No transactions yet.",
    ),
    "financeReportTitle": MessageLookupByLibrary.simpleMessage(
      "Financial Report",
    ),
    "financeScreenTitle": MessageLookupByLibrary.simpleMessage("Finances"),
    "financeTitle": MessageLookupByLibrary.simpleMessage("Finance"),
    "financeTransactionHistoryTitle": MessageLookupByLibrary.simpleMessage(
      "Transaction History",
    ),
    "financeViewTransactionsButton": MessageLookupByLibrary.simpleMessage(
      "View Transactions",
    ),
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "goat": MessageLookupByLibrary.simpleMessage("Goats"),
    "goats": MessageLookupByLibrary.simpleMessage("Goats"),
    "greeting": m5,
    "greetingDescription": MessageLookupByLibrary.simpleMessage(
      "Greeting with username",
    ),
    "healthGood": MessageLookupByLibrary.simpleMessage("Good"),
    "healthLabel": MessageLookupByLibrary.simpleMessage("Health"),
    "healthMedium": MessageLookupByLibrary.simpleMessage("Medium"),
    "healthPoor": MessageLookupByLibrary.simpleMessage("Poor"),
    "healthStatus": MessageLookupByLibrary.simpleMessage("Health Status"),
    "herd": MessageLookupByLibrary.simpleMessage("herd"),
    "herdCattleTypeNotSpecified": MessageLookupByLibrary.simpleMessage(
      "Herd cattle type not specified",
    ),
    "herdNotFound": MessageLookupByLibrary.simpleMessage("Herd not found"),
    "herdTitle": m6,
    "homeCardSubtitle": MessageLookupByLibrary.simpleMessage("Cattle Number"),
    "homeExploreCategories": MessageLookupByLibrary.simpleMessage(
      "Explore Categories",
    ),
    "homeScreenTitle": MessageLookupByLibrary.simpleMessage("Home"),
    "homeTitle": MessageLookupByLibrary.simpleMessage("My Farm"),
    "homeViewLatest": MessageLookupByLibrary.simpleMessage("View Latest"),
    "homeWelcomeMessage": m7,
    "iHaveConfirmed": MessageLookupByLibrary.simpleMessage("I have confirmed"),
    "idNotFoundError": MessageLookupByLibrary.simpleMessage("ID not found"),
    "idNumberLabel": MessageLookupByLibrary.simpleMessage("ID Number:"),
    "idScreenTitle": MessageLookupByLibrary.simpleMessage("Identification"),
    "instructionCardAddCattleDescription": MessageLookupByLibrary.simpleMessage(
      "How to add cattle to the system.",
    ),
    "instructionCardAddCattleTitle": MessageLookupByLibrary.simpleMessage(
      "Adding Cattle",
    ),
    "instructionCardAnimalsTableDescription":
        MessageLookupByLibrary.simpleMessage(
          "How to track animals in the table.",
        ),
    "instructionCardAnimalsTableTitle": MessageLookupByLibrary.simpleMessage(
      "Animals Table",
    ),
    "instructionCardChatBotDescription": MessageLookupByLibrary.simpleMessage(
      "How to use the chat bot for communication.",
    ),
    "instructionCardChatBotTitle": MessageLookupByLibrary.simpleMessage(
      "Chat Bot",
    ),
    "instructionCardDurationLabel": MessageLookupByLibrary.simpleMessage(
      "Duration: ",
    ),
    "instructionCardFeedWarehouseDescription":
        MessageLookupByLibrary.simpleMessage(
          "How to add feed to the warehouse.",
        ),
    "instructionCardFeedWarehouseTitle": MessageLookupByLibrary.simpleMessage(
      "Feed Warehouse",
    ),
    "instructionCardIntroductionDescription":
        MessageLookupByLibrary.simpleMessage(
          "Description of how to get started with the app.",
        ),
    "instructionCardIntroductionTitle": MessageLookupByLibrary.simpleMessage(
      "Introduction",
    ),
    "instructionCardMainScreenDescription":
        MessageLookupByLibrary.simpleMessage(
          "Description of the main screen and features.",
        ),
    "instructionCardMainScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Main Screen",
    ),
    "instructionCardTechPassportDescription":
        MessageLookupByLibrary.simpleMessage(
          "How to add the animal\'s tech passport.",
        ),
    "instructionCardTechPassportTitle": MessageLookupByLibrary.simpleMessage(
      "Tech Passport / Adding",
    ),
    "instructionCardWeightTrackingDescription":
        MessageLookupByLibrary.simpleMessage(
          "How to track changes in animal weight.",
        ),
    "instructionCardWeightTrackingTitle": MessageLookupByLibrary.simpleMessage(
      "Weight Tracking",
    ),
    "instructionContactSupport": MessageLookupByLibrary.simpleMessage(
      "Contact Support",
    ),
    "instructionFaqA1": MessageLookupByLibrary.simpleMessage(
      "A1: You can ... by ...",
    ),
    "instructionFaqQ1": MessageLookupByLibrary.simpleMessage(
      "Q1: How do I ...?",
    ),
    "instructionFaqTitle": MessageLookupByLibrary.simpleMessage(
      "Frequently Asked Questions",
    ),
    "instructionScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Instructions",
    ),
    "instructionStep1Text": MessageLookupByLibrary.simpleMessage(
      "Detailed explanation for the first step...",
    ),
    "instructionStep1Title": MessageLookupByLibrary.simpleMessage(
      "Step 1: Getting Started",
    ),
    "instructionStep2Text": MessageLookupByLibrary.simpleMessage(
      "Detailed explanation for the second step...",
    ),
    "instructionStep2Title": MessageLookupByLibrary.simpleMessage(
      "Step 2: Configuration",
    ),
    "instructionTitle": MessageLookupByLibrary.simpleMessage("How to use"),
    "introDoneButton": MessageLookupByLibrary.simpleMessage("Done"),
    "introNextButton": MessageLookupByLibrary.simpleMessage("Next"),
    "introSkipButton": MessageLookupByLibrary.simpleMessage("Skip"),
    "introSlide1Text": MessageLookupByLibrary.simpleMessage(
      "Discover amazing features and content tailored for you.",
    ),
    "introSlide1Title": MessageLookupByLibrary.simpleMessage(
      "Welcome to Our App!",
    ),
    "introSlide2Text": MessageLookupByLibrary.simpleMessage(
      "Navigate effortlessly and enjoy a seamless experience.",
    ),
    "introSlide2Title": MessageLookupByLibrary.simpleMessage("Easy to Use"),
    "introSlide3Text": MessageLookupByLibrary.simpleMessage(
      "Join our community and start your journey today.",
    ),
    "introSlide3Title": MessageLookupByLibrary.simpleMessage("Get Started"),
    "introTitle": MessageLookupByLibrary.simpleMessage(
      "CYCLONE — your digital assistant in farm management",
    ),
    "invalidInputError": MessageLookupByLibrary.simpleMessage("Invalid input"),
    "invalidNumber": MessageLookupByLibrary.simpleMessage("Enter a number"),
    "itemCategoryHint": MessageLookupByLibrary.simpleMessage(
      "Select a category",
    ),
    "itemCategoryLabel": MessageLookupByLibrary.simpleMessage("Category"),
    "itemDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "Enter a description",
    ),
    "itemDescriptionLabel": MessageLookupByLibrary.simpleMessage("Description"),
    "itemImageUploaded": MessageLookupByLibrary.simpleMessage("Image Uploaded"),
    "itemNameHint": MessageLookupByLibrary.simpleMessage("Enter item name"),
    "itemNameLabel": MessageLookupByLibrary.simpleMessage("Item Name"),
    "itemNoImageSelected": MessageLookupByLibrary.simpleMessage(
      "No image selected",
    ),
    "itemPriceHint": MessageLookupByLibrary.simpleMessage("Enter price"),
    "itemPriceLabel": MessageLookupByLibrary.simpleMessage("Price"),
    "itemUploadImageButton": MessageLookupByLibrary.simpleMessage(
      "Upload Image",
    ),
    "kg": MessageLookupByLibrary.simpleMessage("kg"),
    "kyrgyz": MessageLookupByLibrary.simpleMessage("Kyrgyz"),
    "languagePrompt": MessageLookupByLibrary.simpleMessage("Select language"),
    "loadingError": MessageLookupByLibrary.simpleMessage("Loading error"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Login"),
    "loginEmailHint": MessageLookupByLibrary.simpleMessage("Enter your email"),
    "loginForgotPassword": MessageLookupByLibrary.simpleMessage(
      "Forgot password?",
    ),
    "loginNoAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "loginOrSignInWith": MessageLookupByLibrary.simpleMessage(
      "Or sign in with",
    ),
    "loginPasswordHint": MessageLookupByLibrary.simpleMessage(
      "Enter your password",
    ),
    "loginSignUpButton": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
    "logout": MessageLookupByLibrary.simpleMessage("Log Out"),
    "logoutConfirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to log out?",
    ),
    "logoutTitle": MessageLookupByLibrary.simpleMessage("Log Out"),
    "mainScreenAppBarGreeting": MessageLookupByLibrary.simpleMessage("Yo, "),
    "mainScreenLogoutDialogCancelButton": MessageLookupByLibrary.simpleMessage(
      "Cancel",
    ),
    "mainScreenLogoutDialogConfirmButton": MessageLookupByLibrary.simpleMessage(
      "Logout",
    ),
    "mainScreenLogoutDialogMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to log out?",
    ),
    "mainScreenLogoutDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Account Logout",
    ),
    "medicalCard": MessageLookupByLibrary.simpleMessage("Medical Card"),
    "nameColumn": MessageLookupByLibrary.simpleMessage("Name"),
    "noFeedsYet": MessageLookupByLibrary.simpleMessage("No feeds yet."),
    "noStorageFound": MessageLookupByLibrary.simpleMessage("No storage found."),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "okButton": MessageLookupByLibrary.simpleMessage("OK"),
    "otherRegistrationMethods": MessageLookupByLibrary.simpleMessage(
      "Other registration methods",
    ),
    "passwordChangedSuccess": MessageLookupByLibrary.simpleMessage(
      "Password changed successfully.",
    ),
    "postalCodeHint": MessageLookupByLibrary.simpleMessage("XXXX"),
    "postalCodeLabel": MessageLookupByLibrary.simpleMessage("Postal Code"),
    "profileChangePasswordButton": MessageLookupByLibrary.simpleMessage(
      "Change Password",
    ),
    "profileDialogCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "profileDialogConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "profileEditButton": MessageLookupByLibrary.simpleMessage("Edit Profile"),
    "profileEmailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "profilePhoneNumberLabel": MessageLookupByLibrary.simpleMessage(
      "Phone Number",
    ),
    "profileScreenTitle": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileSignOutButton": MessageLookupByLibrary.simpleMessage("Sign Out"),
    "profileSignOutConfirmationMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to sign out?",
    ),
    "profileSignOutConfirmationTitle": MessageLookupByLibrary.simpleMessage(
      "Sign Out",
    ),
    "profileUsernameLabel": MessageLookupByLibrary.simpleMessage("Username"),
    "reception": MessageLookupByLibrary.simpleMessage("Recv"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "registerButton": MessageLookupByLibrary.simpleMessage("Register"),
    "registration": MessageLookupByLibrary.simpleMessage("Registration"),
    "resendVerification": MessageLookupByLibrary.simpleMessage(
      "Resend verification email",
    ),
    "resetPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Reset Password",
    ),
    "russian": MessageLookupByLibrary.simpleMessage("Russian"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveButton": MessageLookupByLibrary.simpleMessage("Save"),
    "saving": MessageLookupByLibrary.simpleMessage("Saving..."),
    "selectBirthDate": MessageLookupByLibrary.simpleMessage(
      "Select birth date",
    ),
    "selectBreed": MessageLookupByLibrary.simpleMessage("Select breed"),
    "selectButton": MessageLookupByLibrary.simpleMessage("Choose"),
    "selectCattleType": MessageLookupByLibrary.simpleMessage(
      "Select cattle type",
    ),
    "selectHealthStatus": MessageLookupByLibrary.simpleMessage(
      "Select health status",
    ),
    "sendEmailButton": MessageLookupByLibrary.simpleMessage("Send Email"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "sheep": MessageLookupByLibrary.simpleMessage("Sheep"),
    "shopAddToCartButton": MessageLookupByLibrary.simpleMessage("Add to Cart"),
    "shopCallButton": MessageLookupByLibrary.simpleMessage("Call"),
    "shopContactTitle": MessageLookupByLibrary.simpleMessage("Contact us"),
    "shopFeaturedItems": MessageLookupByLibrary.simpleMessage("Featured Items"),
    "shopFilterButton": MessageLookupByLibrary.simpleMessage("Filter"),
    "shopNewArrivals": MessageLookupByLibrary.simpleMessage("New Arrivals"),
    "shopScreenTitle": MessageLookupByLibrary.simpleMessage("Shop"),
    "shopSearchHint": MessageLookupByLibrary.simpleMessage(
      "Search products...",
    ),
    "shopSortByButton": MessageLookupByLibrary.simpleMessage("Sort By"),
    "stadoCreated": MessageLookupByLibrary.simpleMessage(
      "Herd created successfully!",
    ),
    "stadoNumber": MessageLookupByLibrary.simpleMessage("Herd Number"),
    "startQuestion": MessageLookupByLibrary.simpleMessage("Where to start?"),
    "stemEngineeringCategory": MessageLookupByLibrary.simpleMessage(
      "Engineering",
    ),
    "stemExploreTopicButton": MessageLookupByLibrary.simpleMessage(
      "Explore Topic",
    ),
    "stemLearningResources": MessageLookupByLibrary.simpleMessage(
      "Learning Resources",
    ),
    "stemMathematicsCategory": MessageLookupByLibrary.simpleMessage(
      "Mathematics",
    ),
    "stemScienceCategory": MessageLookupByLibrary.simpleMessage("Science"),
    "stemScreenTitle": MessageLookupByLibrary.simpleMessage("STEM Zone"),
    "stemTechnologyCategory": MessageLookupByLibrary.simpleMessage(
      "Technology",
    ),
    "storageTitle": MessageLookupByLibrary.simpleMessage("Feed Storage"),
    "subpageBackButton": MessageLookupByLibrary.simpleMessage("Back"),
    "subpageContentPlaceholder": MessageLookupByLibrary.simpleMessage(
      "More information will be displayed here.",
    ),
    "subpageDefaultTitle": MessageLookupByLibrary.simpleMessage("Details"),
    "subpageSectionTitle": MessageLookupByLibrary.simpleMessage(
      "Section Title",
    ),
    "successTitle": MessageLookupByLibrary.simpleMessage("Success"),
    "table": MessageLookupByLibrary.simpleMessage("Table"),
    "tableHeaderColumn1": MessageLookupByLibrary.simpleMessage("Column 1"),
    "tableHeaderColumn2": MessageLookupByLibrary.simpleMessage("Column 2"),
    "tableHeaderColumn3": MessageLookupByLibrary.simpleMessage("Column 3"),
    "tableNextPage": MessageLookupByLibrary.simpleMessage("Next"),
    "tableNoData": MessageLookupByLibrary.simpleMessage(
      "No data available to display.",
    ),
    "tablePageIndicator": m8,
    "tablePreviousPage": MessageLookupByLibrary.simpleMessage("Previous"),
    "tableScreenTitle": MessageLookupByLibrary.simpleMessage("Data Table"),
    "tableTitle": MessageLookupByLibrary.simpleMessage("Feed Table"),
    "tagNumber": MessageLookupByLibrary.simpleMessage("Tag Number"),
    "techPassport": MessageLookupByLibrary.simpleMessage("Passport"),
    "techPassportHeader": MessageLookupByLibrary.simpleMessage(
      "Technical passport",
    ),
    "unitKg": m9,
    "userNotAuthorized": MessageLookupByLibrary.simpleMessage(
      "User not authorized",
    ),
    "userNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Error: Current user not found.",
    ),
    "valueColumn": MessageLookupByLibrary.simpleMessage("Value"),
    "verifyIdButton": MessageLookupByLibrary.simpleMessage("Verify ID"),
    "weight": MessageLookupByLibrary.simpleMessage("Weight (kg)"),
    "weightLabel": MessageLookupByLibrary.simpleMessage("Weight"),
    "welcomeLogin": MessageLookupByLibrary.simpleMessage("Login"),
    "welcomeSubtitle": MessageLookupByLibrary.simpleMessage(
      "Complete automation of the\ncattle fattening process",
    ),
    "welcomeTitle": MessageLookupByLibrary.simpleMessage("CYCLONE APP"),
  };
}
