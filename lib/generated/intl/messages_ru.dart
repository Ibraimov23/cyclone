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

  static String m0(error) => "Ошибка при отправке подтверждения: ${error}";

  static String m1(email) => "Подтверждение отправлено на адрес ${email}.";

  static String m2(feedName) => "Удалить корм «${feedName}»?";

  static String m3(feedName) => "Редактировать ${feedName}";

  static String m4(userEmail) =>
      "Ссылка для подтверждения была отправлена на ${userEmail}. Пожалуйста, проверьте ваш почтовый ящик и перейдите по ссылке для подтверждения вашего аккаунта.";

  static String m5(username) => "Йоу, ${username}";

  static String m6(stadoName) => "стадо ${stadoName}";

  static String m7(userName) => "Привет, ${userName}!";

  static String m8(currentPage, totalPages) =>
      "Страница ${currentPage} из ${totalPages}";

  static String m9(value) => "${value} кг";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accountAlreadyExistsMessage": MessageLookupByLibrary.simpleMessage(
      "Этот email уже зарегистрирован. Попробуйте войти.",
    ),
    "accountAlreadyExistsTitle": MessageLookupByLibrary.simpleMessage(
      "Аккаунт уже существует",
    ),
    "add": MessageLookupByLibrary.simpleMessage("Добавить"),
    "addAnimal": MessageLookupByLibrary.simpleMessage("Добавить животное"),
    "addAnimalButton": MessageLookupByLibrary.simpleMessage(
      "Добавить животное",
    ),
    "addButton": MessageLookupByLibrary.simpleMessage("Добавить"),
    "addItemButton": MessageLookupByLibrary.simpleMessage("Добавить элемент"),
    "addNewFeedTitle": MessageLookupByLibrary.simpleMessage(
      "Добавить новый корм",
    ),
    "addRecordButton": MessageLookupByLibrary.simpleMessage("Добавить запись"),
    "addScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Добавить новый элемент",
    ),
    "addVaccinationButton": MessageLookupByLibrary.simpleMessage(
      "Добавить запись о вакцинации",
    ),
    "addingTitle": MessageLookupByLibrary.simpleMessage("Добавить карту"),
    "ageLabel": MessageLookupByLibrary.simpleMessage("Возраст"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Уже есть аккаунт?",
    ),
    "animalAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Животное успешно добавлено",
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
    "appTitle": MessageLookupByLibrary.simpleMessage("Подтверждение Email"),
    "birthDate": MessageLookupByLibrary.simpleMessage("Дата рождения"),
    "bottomNavFarm": MessageLookupByLibrary.simpleMessage("Ферма"),
    "bottomNavFeeds": MessageLookupByLibrary.simpleMessage("Кормы"),
    "bottomNavMessages": MessageLookupByLibrary.simpleMessage("Сообщения"),
    "bottomNavShop": MessageLookupByLibrary.simpleMessage("Магазин"),
    "breed": MessageLookupByLibrary.simpleMessage("Порода"),
    "breedAlpine": MessageLookupByLibrary.simpleMessage("Альпийская"),
    "breedAngus": MessageLookupByLibrary.simpleMessage("Ангус"),
    "breedAyrshire": MessageLookupByLibrary.simpleMessage("Айрширская"),
    "breedBlackPied": MessageLookupByLibrary.simpleMessage("Черно-пестрая"),
    "breedBoer": MessageLookupByLibrary.simpleMessage("Бурская"),
    "breedCharolais": MessageLookupByLibrary.simpleMessage("Шароле"),
    "breedDorper": MessageLookupByLibrary.simpleMessage("Дорпер"),
    "breedHereford": MessageLookupByLibrary.simpleMessage("Герефорд"),
    "breedHerefordWhitehead": MessageLookupByLibrary.simpleMessage(
      "Белоголовая",
    ),
    "breedHolstein": MessageLookupByLibrary.simpleMessage("Голштинская"),
    "breedJersey": MessageLookupByLibrary.simpleMessage("Джерсейская"),
    "breedLabel": MessageLookupByLibrary.simpleMessage("Порода"),
    "breedLimousin": MessageLookupByLibrary.simpleMessage("Лимузин"),
    "breedMerino": MessageLookupByLibrary.simpleMessage("Меринос"),
    "breedNubian": MessageLookupByLibrary.simpleMessage("Нубийская"),
    "breedPrecos": MessageLookupByLibrary.simpleMessage("Прекос"),
    "breedRomanov": MessageLookupByLibrary.simpleMessage("Романовская"),
    "breedSaanen": MessageLookupByLibrary.simpleMessage("Зааненская"),
    "breedSimmental": MessageLookupByLibrary.simpleMessage("Симментальская"),
    "breedTexel": MessageLookupByLibrary.simpleMessage("Тексель"),
    "breedToggenburg": MessageLookupByLibrary.simpleMessage("Тоггенбургская"),
    "bull": MessageLookupByLibrary.simpleMessage("Быки"),
    "bullet1": MessageLookupByLibrary.simpleMessage(
      "1. Выберите язык интерфейса — русский или английский.",
    ),
    "bullet2": MessageLookupByLibrary.simpleMessage(
      "2. Зарегистрируйтесь с помощью электронной почты и пароля.",
    ),
    "bullet3": MessageLookupByLibrary.simpleMessage(
      "3. Или войдите через аккаунт Google — быстро и удобно.",
    ),
    "bullet4": MessageLookupByLibrary.simpleMessage(
      "4. После входа вы попадёте на главную панель, где сможете начать работу: добавлять данные, следить за статистикой и получать аналитику.",
    ),
    "bulls": MessageLookupByLibrary.simpleMessage("Быки"),
    "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Отмена"),
    "cardAuthorLabel": MessageLookupByLibrary.simpleMessage("Автор:"),
    "cardCategoryLabel": MessageLookupByLibrary.simpleMessage("Категория:"),
    "cardDateLabel": MessageLookupByLibrary.simpleMessage("Дата:"),
    "cardLearnMoreButton": MessageLookupByLibrary.simpleMessage(
      "Узнать больше",
    ),
    "cardNameHint": MessageLookupByLibrary.simpleMessage("Название"),
    "cardNameLabel": MessageLookupByLibrary.simpleMessage("Название Карты"),
    "cardNumberHint": MessageLookupByLibrary.simpleMessage(
      "XXXX   XXXX   XXXX   XXXX",
    ),
    "cardNumberLabel": MessageLookupByLibrary.simpleMessage("Номер Карты"),
    "cardPriceLabel": MessageLookupByLibrary.simpleMessage("Цена:"),
    "cardPublishedOnLabel": MessageLookupByLibrary.simpleMessage(
      "Опубликовано:",
    ),
    "cardStatusLabel": MessageLookupByLibrary.simpleMessage("Статус:"),
    "cardViewDetailsButton": MessageLookupByLibrary.simpleMessage("Подробнее"),
    "cattleType": MessageLookupByLibrary.simpleMessage("Вид скота"),
    "changeCard": MessageLookupByLibrary.simpleMessage("Изменить карту"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Изменить пароль"),
    "changePasswordButton": MessageLookupByLibrary.simpleMessage("Изменить"),
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
    "checkYourEmail": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, проверьте свою почту",
    ),
    "closingStatement": MessageLookupByLibrary.simpleMessage(
      "CYCLONE делает фермерство понятным, эффективным и современным. Всё управление — у вас под рукой.",
    ),
    "confirmButton": MessageLookupByLibrary.simpleMessage("Подтвердить"),
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
    "confirmYourEmail": MessageLookupByLibrary.simpleMessage(
      "Подтвердите email",
    ),
    "confirmationSendError": m0,
    "confirmationSent": m1,
    "cow": MessageLookupByLibrary.simpleMessage("Коровы"),
    "cows": MessageLookupByLibrary.simpleMessage("Коровы"),
    "createHerdError": MessageLookupByLibrary.simpleMessage(
      "Ошибка при создании стада",
    ),
    "createItemTitle": MessageLookupByLibrary.simpleMessage(
      "Создание нового элемента",
    ),
    "createNewButton": MessageLookupByLibrary.simpleMessage("Создать новый"),
    "createPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Придумайте пароль",
    ),
    "createStado": MessageLookupByLibrary.simpleMessage("Создать стадо"),
    "cvvHint": MessageLookupByLibrary.simpleMessage("CVV"),
    "cvvLabel": MessageLookupByLibrary.simpleMessage("Защитный код"),
    "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
    "deleteCard": MessageLookupByLibrary.simpleMessage("Удалить карту"),
    "deleteFeedConfirmation": m2,
    "detailsCattleCount": MessageLookupByLibrary.simpleMessage("Количество"),
    "detailsCattleName": MessageLookupByLibrary.simpleMessage("Номер скота"),
    "detailsCattleType": MessageLookupByLibrary.simpleMessage("Тип скота"),
    "detailsTitle": MessageLookupByLibrary.simpleMessage("Детали скота"),
    "dividerDescription": MessageLookupByLibrary.simpleMessage(
      "CYCLONE — это приложение, которое помогает фермерам упростить управление кормлением, учитывать рост поголовья и следить за запасами. Всё в одном месте, без бумажной рутины.",
    ),
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
    "duration15min": MessageLookupByLibrary.simpleMessage("15 минут"),
    "duration20min": MessageLookupByLibrary.simpleMessage("20 минут"),
    "duration4min": MessageLookupByLibrary.simpleMessage("4 минут"),
    "duration5min": MessageLookupByLibrary.simpleMessage("5 минут"),
    "editDialog_cancel": MessageLookupByLibrary.simpleMessage("Отменить"),
    "editDialog_hint": MessageLookupByLibrary.simpleMessage("Введите число"),
    "editDialog_insufficientFeed": MessageLookupByLibrary.simpleMessage(
      "Недостаточно корма на складе",
    ),
    "editDialog_invalidNumber": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введите корректное число",
    ),
    "editDialog_label": MessageLookupByLibrary.simpleMessage(
      "Введите новое значение",
    ),
    "editDialog_noStorage": MessageLookupByLibrary.simpleMessage(
      "Склад не найден",
    ),
    "editDialog_save": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "editDialog_saveError": MessageLookupByLibrary.simpleMessage(
      "Ошибка при сохранении данных",
    ),
    "editDialog_title": m3,
    "emailAlreadyRegistered": MessageLookupByLibrary.simpleMessage(
      "Этот адрес электронной почты уже зарегистрирован.",
    ),
    "emailIsEmptyError": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введите ваш email.",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Электронная почта"),
    "emailSentAgain": MessageLookupByLibrary.simpleMessage(
      "Письмо отправлено повторно",
    ),
    "emailSentMessage": MessageLookupByLibrary.simpleMessage(
      "Письмо с подтверждением отправлено на ваш email.",
    ),
    "emailSentSuccess": MessageLookupByLibrary.simpleMessage(
      "Письмо отправлено.",
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
    "emailVerificationMessage": m4,
    "emailVerificationResendButton": MessageLookupByLibrary.simpleMessage(
      "Отправить письмо повторно",
    ),
    "emailVerificationTitle": MessageLookupByLibrary.simpleMessage(
      "Подтвердите ваш Email",
    ),
    "english": MessageLookupByLibrary.simpleMessage("Английский"),
    "enterGender": MessageLookupByLibrary.simpleMessage("Введите пол"),
    "enterIdHint": MessageLookupByLibrary.simpleMessage(
      "Отсканируйте или введите ID",
    ),
    "enterIdLabel": MessageLookupByLibrary.simpleMessage("Введите ID"),
    "enterMedicalCard": MessageLookupByLibrary.simpleMessage(
      "Введите медицинскую карту",
    ),
    "enterNewPassword": MessageLookupByLibrary.simpleMessage(
      "Введите новый пароль",
    ),
    "enterPassword": MessageLookupByLibrary.simpleMessage("Введите пароль"),
    "enterStadoNumber": MessageLookupByLibrary.simpleMessage(
      "Введите уникальный номер стадо",
    ),
    "enterTagNumber": MessageLookupByLibrary.simpleMessage(
      "Введите номер бирки",
    ),
    "enterWeight": MessageLookupByLibrary.simpleMessage("Введите вес"),
    "enterYourEmail": MessageLookupByLibrary.simpleMessage(
      "Введите вашу почту",
    ),
    "errorAddingAnimal": MessageLookupByLibrary.simpleMessage(
      "Ошибка при добавлении животного",
    ),
    "errorAuthentication": MessageLookupByLibrary.simpleMessage(
      "Ошибка аутентификации",
    ),
    "errorLoadingBreeds": MessageLookupByLibrary.simpleMessage(
      "Ошибка загрузки пород",
    ),
    "errorLoadingHealthStatuses": MessageLookupByLibrary.simpleMessage(
      "Ошибка загрузки статусов здоровья",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Ошибка"),
    "expiryDateHint": MessageLookupByLibrary.simpleMessage("MM/YY"),
    "expiryDateLabel": MessageLookupByLibrary.simpleMessage("Дата/Год"),
    "feedNameHint": MessageLookupByLibrary.simpleMessage("Название корма"),
    "feedSubtitle": MessageLookupByLibrary.simpleMessage(
      "От 1500 сомов за мешок.",
    ),
    "feedTitle": MessageLookupByLibrary.simpleMessage(
      "Корм для скота высшего качества!",
    ),
    "feedUnit": MessageLookupByLibrary.simpleMessage("корм ед."),
    "feedUnitHint": MessageLookupByLibrary.simpleMessage(
      "Кормовая единица на 1 кг",
    ),
    "feedValueHint": MessageLookupByLibrary.simpleMessage("Значение корма"),
    "fieldCorns": MessageLookupByLibrary.simpleMessage("Кукуруза"),
    "fieldHays": MessageLookupByLibrary.simpleMessage("Сено"),
    "fieldHerbs": MessageLookupByLibrary.simpleMessage("Трава"),
    "fieldOats": MessageLookupByLibrary.simpleMessage("Овес"),
    "fieldPeas": MessageLookupByLibrary.simpleMessage("Горох"),
    "fieldRequired": MessageLookupByLibrary.simpleMessage("Заполните все поля"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Это поле обязательно для заполнения",
    ),
    "fieldSilages": MessageLookupByLibrary.simpleMessage("Силос"),
    "fieldStraws": MessageLookupByLibrary.simpleMessage("Солома"),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, заполните все поля",
    ),
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
    "financeTitle": MessageLookupByLibrary.simpleMessage("Финансы"),
    "financeTransactionHistoryTitle": MessageLookupByLibrary.simpleMessage(
      "История транзакций",
    ),
    "financeViewTransactionsButton": MessageLookupByLibrary.simpleMessage(
      "Посмотреть транзакции",
    ),
    "gender": MessageLookupByLibrary.simpleMessage("Пол"),
    "goat": MessageLookupByLibrary.simpleMessage("Козлы"),
    "goats": MessageLookupByLibrary.simpleMessage("Козлы"),
    "greeting": m5,
    "greetingDescription": MessageLookupByLibrary.simpleMessage(
      "Приветствие с именем пользователя",
    ),
    "healthGood": MessageLookupByLibrary.simpleMessage("Хорошее"),
    "healthLabel": MessageLookupByLibrary.simpleMessage("Здоровье"),
    "healthMedium": MessageLookupByLibrary.simpleMessage("Среднее"),
    "healthPoor": MessageLookupByLibrary.simpleMessage("Плохое"),
    "healthStatus": MessageLookupByLibrary.simpleMessage("Статус здоровья"),
    "herd": MessageLookupByLibrary.simpleMessage("стадо"),
    "herdCattleTypeNotSpecified": MessageLookupByLibrary.simpleMessage(
      "Тип скота в стаде не указан",
    ),
    "herdNotFound": MessageLookupByLibrary.simpleMessage("Стадо не найдено"),
    "herdTitle": m6,
    "homeCardSubtitle": MessageLookupByLibrary.simpleMessage("Номер скота"),
    "homeExploreCategories": MessageLookupByLibrary.simpleMessage(
      "Исследовать категории",
    ),
    "homeScreenTitle": MessageLookupByLibrary.simpleMessage("Главная"),
    "homeTitle": MessageLookupByLibrary.simpleMessage("Моя ферма"),
    "homeViewLatest": MessageLookupByLibrary.simpleMessage("Смотреть новое"),
    "homeWelcomeMessage": m7,
    "iHaveConfirmed": MessageLookupByLibrary.simpleMessage("Я подтвердил"),
    "idNotFoundError": MessageLookupByLibrary.simpleMessage("ID не найден"),
    "idNumberLabel": MessageLookupByLibrary.simpleMessage("Номер ID:"),
    "idScreenTitle": MessageLookupByLibrary.simpleMessage("Идентификация"),
    "instructionCardAddCattleDescription": MessageLookupByLibrary.simpleMessage(
      "Как добавить скот в систему.",
    ),
    "instructionCardAddCattleTitle": MessageLookupByLibrary.simpleMessage(
      "Добавление скота",
    ),
    "instructionCardAnimalsTableDescription":
        MessageLookupByLibrary.simpleMessage(
          "Как отслеживать животных в таблице.",
        ),
    "instructionCardAnimalsTableTitle": MessageLookupByLibrary.simpleMessage(
      "Таблица животных",
    ),
    "instructionCardChatBotDescription": MessageLookupByLibrary.simpleMessage(
      "Как использовать чат-бота для общения.",
    ),
    "instructionCardChatBotTitle": MessageLookupByLibrary.simpleMessage(
      "Чат бот",
    ),
    "instructionCardDurationLabel": MessageLookupByLibrary.simpleMessage(
      "Длительность: ",
    ),
    "instructionCardFeedWarehouseDescription":
        MessageLookupByLibrary.simpleMessage("Как добавить корма на склад."),
    "instructionCardFeedWarehouseTitle": MessageLookupByLibrary.simpleMessage(
      "Склад кормов",
    ),
    "instructionCardIntroductionDescription":
        MessageLookupByLibrary.simpleMessage(
          "Описание как начать работу с приложением.",
        ),
    "instructionCardIntroductionTitle": MessageLookupByLibrary.simpleMessage(
      "Введение",
    ),
    "instructionCardMainScreenDescription":
        MessageLookupByLibrary.simpleMessage(
          "Описание основ экрана и функций.",
        ),
    "instructionCardMainScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Главный экран",
    ),
    "instructionCardTechPassportDescription":
        MessageLookupByLibrary.simpleMessage(
          "Как добавить техпаспорт животного.",
        ),
    "instructionCardTechPassportTitle": MessageLookupByLibrary.simpleMessage(
      "Тех паспорт / Добавление",
    ),
    "instructionCardWeightTrackingDescription":
        MessageLookupByLibrary.simpleMessage(
          "Как отслеживать изменение веса животных.",
        ),
    "instructionCardWeightTrackingTitle": MessageLookupByLibrary.simpleMessage(
      "Отслеживание веса",
    ),
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
    "instructionTitle": MessageLookupByLibrary.simpleMessage(
      "Как пользоваться",
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
    "introTitle": MessageLookupByLibrary.simpleMessage(
      "CYCLONE — ваш цифровой помощник в управлении фермой",
    ),
    "invalidInputError": MessageLookupByLibrary.simpleMessage(
      "Некорректный ввод",
    ),
    "invalidNumber": MessageLookupByLibrary.simpleMessage("Введите число"),
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
    "kg": MessageLookupByLibrary.simpleMessage("кг"),
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
    "medicalCard": MessageLookupByLibrary.simpleMessage("Медицинская карта"),
    "nameColumn": MessageLookupByLibrary.simpleMessage("Название"),
    "noFeedsYet": MessageLookupByLibrary.simpleMessage("Пока нет кормов."),
    "noStorageFound": MessageLookupByLibrary.simpleMessage(
      "Хранилище не найдено.",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("ОК"),
    "okButton": MessageLookupByLibrary.simpleMessage("ОК"),
    "otherRegistrationMethods": MessageLookupByLibrary.simpleMessage(
      "Другой способ регистрации",
    ),
    "passwordChangedSuccess": MessageLookupByLibrary.simpleMessage(
      "Пароль успешно изменен.",
    ),
    "postalCodeHint": MessageLookupByLibrary.simpleMessage("XXXX"),
    "postalCodeLabel": MessageLookupByLibrary.simpleMessage("Почтовый Индекс"),
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
    "reception": MessageLookupByLibrary.simpleMessage("Прием"),
    "register": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
    "registerButton": MessageLookupByLibrary.simpleMessage("Регистрация"),
    "registration": MessageLookupByLibrary.simpleMessage("Регистрация"),
    "resendVerification": MessageLookupByLibrary.simpleMessage(
      "Отправить письмо еще раз",
    ),
    "resetPasswordTitle": MessageLookupByLibrary.simpleMessage("Сброс пароля"),
    "russian": MessageLookupByLibrary.simpleMessage("Русский"),
    "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "saveButton": MessageLookupByLibrary.simpleMessage("Сохранить"),
    "saving": MessageLookupByLibrary.simpleMessage("Сохранение..."),
    "selectBirthDate": MessageLookupByLibrary.simpleMessage(
      "Выберите дату рождения",
    ),
    "selectBreed": MessageLookupByLibrary.simpleMessage("Выберите породу"),
    "selectButton": MessageLookupByLibrary.simpleMessage("Выбрать"),
    "selectCattleType": MessageLookupByLibrary.simpleMessage(
      "Выберите вид скота",
    ),
    "selectHealthStatus": MessageLookupByLibrary.simpleMessage(
      "Выберите статус здоровья",
    ),
    "sendEmailButton": MessageLookupByLibrary.simpleMessage("Отправить письмо"),
    "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
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
    "stadoCreated": MessageLookupByLibrary.simpleMessage(
      "Стадо успешно создано!",
    ),
    "stadoNumber": MessageLookupByLibrary.simpleMessage("Номер стадо"),
    "startQuestion": MessageLookupByLibrary.simpleMessage("С чего начать?"),
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
    "successTitle": MessageLookupByLibrary.simpleMessage("Успех"),
    "table": MessageLookupByLibrary.simpleMessage("Таблица"),
    "tableHeaderColumn1": MessageLookupByLibrary.simpleMessage("Колонка 1"),
    "tableHeaderColumn2": MessageLookupByLibrary.simpleMessage("Колонка 2"),
    "tableHeaderColumn3": MessageLookupByLibrary.simpleMessage("Колонка 3"),
    "tableNextPage": MessageLookupByLibrary.simpleMessage("Следующая"),
    "tableNoData": MessageLookupByLibrary.simpleMessage(
      "Нет данных для отображения.",
    ),
    "tablePageIndicator": m8,
    "tablePreviousPage": MessageLookupByLibrary.simpleMessage("Предыдущая"),
    "tableScreenTitle": MessageLookupByLibrary.simpleMessage("Таблица данных"),
    "tableTitle": MessageLookupByLibrary.simpleMessage("Таблица корма"),
    "tagNumber": MessageLookupByLibrary.simpleMessage("Клеймо животного"),
    "techPassport": MessageLookupByLibrary.simpleMessage("Техпаспорт"),
    "techPassportHeader": MessageLookupByLibrary.simpleMessage(
      "Технический паспорт",
    ),
    "unitKg": m9,
    "userNotAuthorized": MessageLookupByLibrary.simpleMessage(
      "Пользователь не авторизован",
    ),
    "userNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Ошибка: Текущий пользователь не найден.",
    ),
    "valueColumn": MessageLookupByLibrary.simpleMessage("Значение"),
    "verifyIdButton": MessageLookupByLibrary.simpleMessage("Проверить ID"),
    "weight": MessageLookupByLibrary.simpleMessage("Вес (кг)"),
    "weightLabel": MessageLookupByLibrary.simpleMessage("Вес"),
    "welcomeLogin": MessageLookupByLibrary.simpleMessage("Вход"),
    "welcomeSubtitle": MessageLookupByLibrary.simpleMessage(
      "Полная автоматизация процесса\nоткорма скота",
    ),
    "welcomeTitle": MessageLookupByLibrary.simpleMessage("CYCLONE APP"),
  };
}
