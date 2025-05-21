// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(userEmail) =>
      "Ссылка для подтверждения была отправлена на ${userEmail}. Пожалуйста, проверьте ваш почтовый ящик и перейдите по ссылке для подтверждения вашего аккаунта.";

  static String m1(userName) => "Привет, ${userName}!";

  static String m2(currentPage, totalPages) =>
      "Страница ${currentPage} из ${totalPages}";

  static String m3(value) => "${value} кг";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accountAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Этот email уже зарегистрирован. Попробуйте войти.",
    ),
    "accountAlreadyExistsTitle": MessageLookupByLibrary.simpleMessage(
      "Аккаунт уже существует",
    ),
    "addItemButton": MessageLookupByLibrary.simpleMessage("Добавить элемент"),
    "addRecordButton": MessageLookupByLibrary.simpleMessage("Добавить запись"),
    "addScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Добавить новый элемент",
    ),
    "addVaccinationButton": MessageLookupByLibrary.simpleMessage(
      "Добавить запись о вакцинации",
    ),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Уже есть аккаунт?",
    ),
    "animalBreedLabel": MessageLookupByLibrary.simpleMessage("Порода"),
    "animalDateOfBirthLabel": MessageLookupByLibrary.simpleMessage(
      "Дата рождения",
    ),
    "animalMicrochipIdLabel": MessageLookupByLibrary.simpleMessage(
      "ID микрочипа",
    ),
    "animalNameLabel": MessageLookupByLibrary.simpleMessage("Кличка животного"),
    "animalOwnerLabel": MessageLookupByLibrary.simpleMessage("Владелец"),
    "animalPassportTitle": MessageLookupByLibrary.simpleMessage(
      "Паспорт животного",
    ),
    "animalSpeciesLabel": MessageLookupByLibrary.simpleMessage("Вид"),
    "animalVaccinationsTitle": MessageLookupByLibrary.simpleMessage(
      "Вакцинации",
    ),
    "appBackTooltip": MessageLookupByLibrary.simpleMessage("Назад"),
    "appBarNotificationsTooltip": MessageLookupByLibrary.simpleMessage(
      "Уведомления",
    ),
    "appBarSearchTooltip": MessageLookupByLibrary.simpleMessage("Поиск"),
    "appBarSettingsTooltip": MessageLookupByLibrary.simpleMessage("Настройки"),
    "bottomNavFarm": MessageLookupByLibrary.simpleMessage("Ферма"),
    "bottomNavFeeds": MessageLookupByLibrary.simpleMessage("Кормы"),
    "bottomNavMessages": MessageLookupByLibrary.simpleMessage("Сообщения"),
    "bottomNavShop": MessageLookupByLibrary.simpleMessage("Магазин"),
    "bulls": MessageLookupByLibrary.simpleMessage("Быки"),
    "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Отмена"),
    "cardAuthorLabel": MessageLookupByLibrary.simpleMessage("Автор:"),
    "cardCategoryLabel": MessageLookupByLibrary.simpleMessage("Категория:"),
    "cardDateLabel": MessageLookupByLibrary.simpleMessage("Дата:"),
    "cardLearnMoreButton": MessageLookupByLibrary.simpleMessage(
      "Узнать больше",
    ),
    "cardPriceLabel": MessageLookupByLibrary.simpleMessage("Цена:"),
    "cardPublishedOnLabel": MessageLookupByLibrary.simpleMessage(
      "Опубликовано:",
    ),
    "cardStatusLabel": MessageLookupByLibrary.simpleMessage("Статус:"),
    "cardViewDetailsButton": MessageLookupByLibrary.simpleMessage("Подробнее"),
    "changeValue": MessageLookupByLibrary.simpleMessage("Изменить значение"),
    "chatbotCouldNotUnderstand": MessageLookupByLibrary.simpleMessage(
      "Извините, я не смог этого понять. Не могли бы вы перефразировать?",
    ),
    "chatbotErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "Произошла ошибка. Пожалуйста, попробуйте позже.",
    ),
    "chatbotScreenTitle": MessageLookupByLibrary.simpleMessage("Чат поддержки"),
    "chatbotSendButtonTooltip": MessageLookupByLibrary.simpleMessage(
      "Отправить",
    ),
    "chatbotThinking": MessageLookupByLibrary.simpleMessage("Думаю..."),
    "chatbotTypeMessageHint": MessageLookupByLibrary.simpleMessage(
      "Введите ваше сообщение...",
    ),
    "chatbotWelcomeMessage": MessageLookupByLibrary.simpleMessage(
      "Привет! Чем могу помочь?",
    ),
    "confirmEditButton": MessageLookupByLibrary.simpleMessage("Изменить"),
    "confirmMessage": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, проверьте данные перед отправкой.",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "Подтвердите пароль",
    ),
    "confirmScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Подтверждение данных",
    ),
    "confirmSubmitButton": MessageLookupByLibrary.simpleMessage("Отправить"),
    "cows": MessageLookupByLibrary.simpleMessage("Коровы"),
    "createItemTitle": MessageLookupByLibrary.simpleMessage(
      "Создание нового элемента",
    ),
    "createNewButton": MessageLookupByLibrary.simpleMessage("Создать новый"),
    "detailsCattleCount": MessageLookupByLibrary.simpleMessage("Количество"),
    "detailsCattleName": MessageLookupByLibrary.simpleMessage("Номер скота"),
    "detailsCattleType": MessageLookupByLibrary.simpleMessage("Тип скота"),
    "detailsTitle": MessageLookupByLibrary.simpleMessage("Детали скота"),
    "drawerAbout": MessageLookupByLibrary.simpleMessage("О нас"),
    "drawerAddAccount": MessageLookupByLibrary.simpleMessage(
      "Добавить аккаунт",
    ),
    "drawerHome": MessageLookupByLibrary.simpleMessage("Главная"),
    "drawerInstructions": MessageLookupByLibrary.simpleMessage("Инструкции"),
    "drawerLanguage": MessageLookupByLibrary.simpleMessage("Язык"),
    "drawerLogout": MessageLookupByLibrary.simpleMessage("Выйти"),
    "drawerProfile": MessageLookupByLibrary.simpleMessage("Профиль"),
    "drawerSettings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "drawerShop": MessageLookupByLibrary.simpleMessage("Магазин"),
    "drawerSoon": MessageLookupByLibrary.simpleMessage("Скоро будет доступно"),
    "drawerStats": MessageLookupByLibrary.simpleMessage("Статистика"),
    "drawerSubscription": MessageLookupByLibrary.simpleMessage("Подписка"),
    "emailSentMessage": MessageLookupByLibrary.simpleMessage(
      "Письмо с подтверждением отправлено на ваш email.",
    ),
    "emailSentTitle": MessageLookupByLibrary.simpleMessage("Письмо отправлено"),
    "emailVerificationCheckSpam": MessageLookupByLibrary.simpleMessage(
      "Если вы не видите письмо, проверьте папку \"Спам\".",
    ),
    "emailVerificationContinueButton": MessageLookupByLibrary.simpleMessage(
      "Продолжить (после подтверждения)",
    ),
    "emailVerificationEmailSentMessage": MessageLookupByLibrary.simpleMessage(
      "Новое письмо для подтверждения было отправлено.",
    ),
    "emailVerificationMessage": m0,
    "emailVerificationResendButton": MessageLookupByLibrary.simpleMessage(
      "Отправить письмо повторно",
    ),
    "emailVerificationTitle": MessageLookupByLibrary.simpleMessage(
      "Подтвердите ваш Email",
    ),
    "english": MessageLookupByLibrary.simpleMessage("Английский"),
    "enterIdHint": MessageLookupByLibrary.simpleMessage(
      "Отсканируйте или введите ID",
    ),
    "enterIdLabel": MessageLookupByLibrary.simpleMessage("Введите ID"),
    "enterPassword": MessageLookupByLibrary.simpleMessage("Введите пароль"),
    "enterYourEmail": MessageLookupByLibrary.simpleMessage(
      "Введите вашу почту",
    ),
    "errorAuthentication": MessageLookupByLibrary.simpleMessage(
      "Ошибка аутентификации",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Ошибка"),
    "feedSubtitle": MessageLookupByLibrary.simpleMessage(
      "От 1500 сомов за мешок.",
    ),
    "feedTitle": MessageLookupByLibrary.simpleMessage(
      "Корм для скота высшего качества!",
    ),
    "fieldCorns": MessageLookupByLibrary.simpleMessage("Кукуруза"),
    "fieldHays": MessageLookupByLibrary.simpleMessage("Сено"),
    "fieldHerbs": MessageLookupByLibrary.simpleMessage("Трава"),
    "fieldOats": MessageLookupByLibrary.simpleMessage("Овес"),
    "fieldPeas": MessageLookupByLibrary.simpleMessage("Горох"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Это поле обязательно для заполнения",
    ),
    "fieldSilages": MessageLookupByLibrary.simpleMessage("Силос"),
    "fieldStraws": MessageLookupByLibrary.simpleMessage("Солома"),
    "financeAddTransactionButton": MessageLookupByLibrary.simpleMessage(
      "Добавить транзакцию",
    ),
    "financeBalanceLabel": MessageLookupByLibrary.simpleMessage(
      "Текущий баланс:",
    ),
    "financeExpensesLabel": MessageLookupByLibrary.simpleMessage("Расходы"),
    "financeGenerateReportButton": MessageLookupByLibrary.simpleMessage(
      "Сформировать отчет",
    ),
    "financeIncomeLabel": MessageLookupByLibrary.simpleMessage("Доходы"),
    "financeNoTransactions": MessageLookupByLibrary.simpleMessage(
      "Транзакций пока нет.",
    ),
    "financeReportTitle": MessageLookupByLibrary.simpleMessage(
      "Финансовый отчет",
    ),
    "financeScreenTitle": MessageLookupByLibrary.simpleMessage("Финансы"),
    "financeTransactionHistoryTitle": MessageLookupByLibrary.simpleMessage(
      "История транзакций",
    ),
    "financeViewTransactionsButton": MessageLookupByLibrary.simpleMessage(
      "Посмотреть транзакции",
    ),
    "goats": MessageLookupByLibrary.simpleMessage("Козлы"),
    "homeCardSubtitle": MessageLookupByLibrary.simpleMessage("Номер скота"),
    "homeExploreCategories": MessageLookupByLibrary.simpleMessage(
      "Исследовать категории",
    ),
    "homeScreenTitle": MessageLookupByLibrary.simpleMessage("Главная"),
    "homeTitle": MessageLookupByLibrary.simpleMessage("Моя ферма"),
    "homeViewLatest": MessageLookupByLibrary.simpleMessage("Смотреть новое"),
    "homeWelcomeMessage": m1,
    "idNotFoundError": MessageLookupByLibrary.simpleMessage("ID не найден"),
    "idNumberLabel": MessageLookupByLibrary.simpleMessage("Номер ID:"),
    "idScreenTitle": MessageLookupByLibrary.simpleMessage("Идентификация"),
    "instructionContactSupport": MessageLookupByLibrary.simpleMessage(
      "Связаться с поддержкой",
    ),
    "instructionFaqA1": MessageLookupByLibrary.simpleMessage(
      "О1: Вы можете ... через ...",
    ),
    "instructionFaqQ1": MessageLookupByLibrary.simpleMessage(
      "В1: Как мне ...?",
    ),
    "instructionFaqTitle": MessageLookupByLibrary.simpleMessage(
      "Часто задаваемые вопросы",
    ),
    "instructionScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Инструкции",
    ),
    "instructionStep1Text": MessageLookupByLibrary.simpleMessage(
      "Подробное объяснение первого шага...",
    ),
    "instructionStep1Title": MessageLookupByLibrary.simpleMessage(
      "Шаг 1: Начало работы",
    ),
    "instructionStep2Text": MessageLookupByLibrary.simpleMessage(
      "Подробное объяснение второго шага...",
    ),
    "instructionStep2Title": MessageLookupByLibrary.simpleMessage(
      "Шаг 2: Настройка",
    ),
    "introDoneButton": MessageLookupByLibrary.simpleMessage("Готово"),
    "introNextButton": MessageLookupByLibrary.simpleMessage("Далее"),
    "introSkipButton": MessageLookupByLibrary.simpleMessage("Пропустить"),
    "introSlide1Text": MessageLookupByLibrary.simpleMessage(
      "Откройте для себя удивительные функции и контент, созданный для вас.",
    ),
    "introSlide1Title": MessageLookupByLibrary.simpleMessage(
      "Добро пожаловать в наше приложение!",
    ),
    "introSlide2Text": MessageLookupByLibrary.simpleMessage(
      "Легко перемещайтесь и наслаждайтесь безупречным опытом.",
    ),
    "introSlide2Title": MessageLookupByLibrary.simpleMessage(
      "Простота в использовании",
    ),
    "introSlide3Text": MessageLookupByLibrary.simpleMessage(
      "Присоединяйтесь к нашему сообществу и начните свое путешествие сегодня.",
    ),
    "introSlide3Title": MessageLookupByLibrary.simpleMessage("Начать"),
    "invalidInputError": MessageLookupByLibrary.simpleMessage(
      "Некорректный ввод",
    ),
    "itemCategoryHint": MessageLookupByLibrary.simpleMessage(
      "Выберите категорию",
    ),
    "itemCategoryLabel": MessageLookupByLibrary.simpleMessage("Категория"),
    "itemDescriptionHint": MessageLookupByLibrary.simpleMessage(
      "Введите описание",
    ),
    "itemDescriptionLabel": MessageLookupByLibrary.simpleMessage("Описание"),
    "itemImageUploaded": MessageLookupByLibrary.simpleMessage(
      "Изображение загружено",
    ),
    "itemNameHint": MessageLookupByLibrary.simpleMessage(
      "Введите название элемента",
    ),
    "itemNameLabel": MessageLookupByLibrary.simpleMessage("Название элемента"),
    "itemNoImageSelected": MessageLookupByLibrary.simpleMessage(
      "Изображение не выбрано",
    ),
    "itemPriceHint": MessageLookupByLibrary.simpleMessage("Введите цену"),
    "itemPriceLabel": MessageLookupByLibrary.simpleMessage("Цена"),
    "itemUploadImageButton": MessageLookupByLibrary.simpleMessage(
      "Загрузить изображение",
    ),
    "kyrgyz": MessageLookupByLibrary.simpleMessage("Кыргызский"),
    "languagePrompt": MessageLookupByLibrary.simpleMessage("Выберите язык"),
    "loadingError": MessageLookupByLibrary.simpleMessage("Ошибка загрузки"),
    "login": MessageLookupByLibrary.simpleMessage("Вход"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Войти"),
    "loginEmailHint": MessageLookupByLibrary.simpleMessage(
      "Введите вашу почту",
    ),
    "loginForgotPassword": MessageLookupByLibrary.simpleMessage(
      "Забыли пароль?",
    ),
    "loginNoAccount": MessageLookupByLibrary.simpleMessage(
      "У вас нет аккаунта?",
    ),
    "loginOrSignInWith": MessageLookupByLibrary.simpleMessage(
      "Другой способ входа",
    ),
    "loginPasswordHint": MessageLookupByLibrary.simpleMessage("Введите пароль"),
    "loginSignUpButton": MessageLookupByLibrary.simpleMessage("Регистрация"),
    "loginTitle": MessageLookupByLibrary.simpleMessage("Вход"),
    "logout": MessageLookupByLibrary.simpleMessage("Выйти"),
    "logoutConfirmation": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите выйти?",
    ),
    "logoutTitle": MessageLookupByLibrary.simpleMessage("Выход из аккаунта"),
    "mainScreenAppBarGreeting": MessageLookupByLibrary.simpleMessage("Йоу, "),
    "mainScreenLogoutDialogCancelButton": MessageLookupByLibrary.simpleMessage(
      "Отмена",
    ),
    "mainScreenLogoutDialogConfirmButton": MessageLookupByLibrary.simpleMessage(
      "Выйти",
    ),
    "mainScreenLogoutDialogMessage": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите выйти?",
    ),
    "mainScreenLogoutDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Выход из аккаунта",
    ),
    "nameColumn": MessageLookupByLibrary.simpleMessage("Название"),
    "ok": MessageLookupByLibrary.simpleMessage("ОК"),
    "otherRegistrationMethods": MessageLookupByLibrary.simpleMessage(
      "Другой способ регистрации",
    ),
    "profileChangePasswordButton": MessageLookupByLibrary.simpleMessage(
      "Изменить пароль",
    ),
    "profileDialogCancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "profileDialogConfirm": MessageLookupByLibrary.simpleMessage("Подтвердить"),
    "profileEditButton": MessageLookupByLibrary.simpleMessage(
      "Редактировать профиль",
    ),
    "profileEmailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "profilePhoneNumberLabel": MessageLookupByLibrary.simpleMessage(
      "Номер телефона",
    ),
    "profileScreenTitle": MessageLookupByLibrary.simpleMessage("Профиль"),
    "profileSignOutButton": MessageLookupByLibrary.simpleMessage("Выйти"),
    "profileSignOutConfirmationMessage": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите выйти?",
    ),
    "profileSignOutConfirmationTitle": MessageLookupByLibrary.simpleMessage(
      "Выход",
    ),
    "profileUsernameLabel": MessageLookupByLibrary.simpleMessage(
      "Имя пользователя",
    ),
    "register": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
    "registerButton": MessageLookupByLibrary.simpleMessage("Регистрация"),
    "registration": MessageLookupByLibrary.simpleMessage("Регистрация"),
    "russian": MessageLookupByLibrary.simpleMessage("Русский"),
    "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "saveButton": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "selectButton": MessageLookupByLibrary.simpleMessage("Выбрать"),
    "sheep": MessageLookupByLibrary.simpleMessage("Овцы"),
    "shopAddToCartButton": MessageLookupByLibrary.simpleMessage(
      "Добавить в корзину",
    ),
    "shopCallButton": MessageLookupByLibrary.simpleMessage("Позвонить"),
    "shopContactTitle": MessageLookupByLibrary.simpleMessage(
      "Свяжитесь с нами",
    ),
    "shopFeaturedItems": MessageLookupByLibrary.simpleMessage(
      "Рекомендуемые товары",
    ),
    "shopFilterButton": MessageLookupByLibrary.simpleMessage("Фильтр"),
    "shopNewArrivals": MessageLookupByLibrary.simpleMessage(
      "Новые поступления",
    ),
    "shopScreenTitle": MessageLookupByLibrary.simpleMessage("Магазин"),
    "shopSearchHint": MessageLookupByLibrary.simpleMessage("Поиск товаров..."),
    "shopSortByButton": MessageLookupByLibrary.simpleMessage("Сортировать по"),
    "stemEngineeringCategory": MessageLookupByLibrary.simpleMessage(
      "Инженерия",
    ),
    "stemExploreTopicButton": MessageLookupByLibrary.simpleMessage(
      "Изучить тему",
    ),
    "stemLearningResources": MessageLookupByLibrary.simpleMessage(
      "Учебные ресурсы",
    ),
    "stemMathematicsCategory": MessageLookupByLibrary.simpleMessage(
      "Математика",
    ),
    "stemScienceCategory": MessageLookupByLibrary.simpleMessage("Наука"),
    "stemScreenTitle": MessageLookupByLibrary.simpleMessage("STEM Зона"),
    "stemTechnologyCategory": MessageLookupByLibrary.simpleMessage(
      "Технологии",
    ),
    "storageTitle": MessageLookupByLibrary.simpleMessage("Склад кормов"),
    "subpageBackButton": MessageLookupByLibrary.simpleMessage("Назад"),
    "subpageContentPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Дополнительная информация будет отображена здесь.",
    ),
    "subpageDefaultTitle": MessageLookupByLibrary.simpleMessage("Детали"),
    "subpageSectionTitle": MessageLookupByLibrary.simpleMessage(
      "Название раздела",
    ),
    "tableHeaderColumn1": MessageLookupByLibrary.simpleMessage("Колонка 1"),
    "tableHeaderColumn2": MessageLookupByLibrary.simpleMessage("Колонка 2"),
    "tableHeaderColumn3": MessageLookupByLibrary.simpleMessage("Колонка 3"),
    "tableNextPage": MessageLookupByLibrary.simpleMessage("Следующая"),
    "tableNoData": MessageLookupByLibrary.simpleMessage(
      "Нет данных для отображения.",
    ),
    "tablePageIndicator": m2,
    "tablePreviousPage": MessageLookupByLibrary.simpleMessage("Предыдущая"),
    "tableScreenTitle": MessageLookupByLibrary.simpleMessage("Таблица данных"),
    "unitKg": m3,
    "valueColumn": MessageLookupByLibrary.simpleMessage("Значение"),
    "verifyIdButton": MessageLookupByLibrary.simpleMessage("Проверить ID"),
    "welcomeLogin": MessageLookupByLibrary.simpleMessage("Вход"),
    "welcomeSubtitle": MessageLookupByLibrary.simpleMessage(
      "Полная автоматизация процесса\nоткорма скота",
    ),
    "welcomeTitle": MessageLookupByLibrary.simpleMessage("CYCLONE APP"),
  };
}
