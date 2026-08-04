import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ru')];

  /// No description provided for @commonOk.
  ///
  /// In ru, this message translates to:
  /// **'Ок'**
  String get commonOk;

  /// No description provided for @commonCancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get commonCancel;

  /// No description provided for @commonEmptyFieldError.
  ///
  /// In ru, this message translates to:
  /// **'Поле не может быть пустым'**
  String get commonEmptyFieldError;

  /// No description provided for @commonRequestError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка при выполнении запроса'**
  String get commonRequestError;

  /// No description provided for @commonRetry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get commonRetry;

  /// No description provided for @toastNetworkError.
  ///
  /// In ru, this message translates to:
  /// **'Нет соединения с сетью'**
  String get toastNetworkError;

  /// No description provided for @toastServerError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка сервера. Попробуйте позже'**
  String get toastServerError;

  /// No description provided for @toastAuthError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка авторизации'**
  String get toastAuthError;

  /// No description provided for @toastUnexpectedError.
  ///
  /// In ru, this message translates to:
  /// **'Произошла непредвиденная ошибка'**
  String get toastUnexpectedError;

  /// No description provided for @toastGenericError.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так'**
  String get toastGenericError;

  /// No description provided for @loginTitle.
  ///
  /// In ru, this message translates to:
  /// **'Вход'**
  String get loginTitle;

  /// No description provided for @loginEmailFieldTitle.
  ///
  /// In ru, this message translates to:
  /// **'Введите логин:'**
  String get loginEmailFieldTitle;

  /// No description provided for @loginEmailFieldHint.
  ///
  /// In ru, this message translates to:
  /// **'e-mail'**
  String get loginEmailFieldHint;

  /// No description provided for @loginPasswordFieldTitle.
  ///
  /// In ru, this message translates to:
  /// **'Введите пароль:'**
  String get loginPasswordFieldTitle;

  /// No description provided for @loginPasswordFieldHint.
  ///
  /// In ru, this message translates to:
  /// **'пароль'**
  String get loginPasswordFieldHint;

  /// No description provided for @loginButtonLabel.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get loginButtonLabel;

  /// No description provided for @loginToRegistrationButtonLabel.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get loginToRegistrationButtonLabel;

  /// No description provided for @loginExceptionInvalidCredential.
  ///
  /// In ru, this message translates to:
  /// **'Неправильные логин или пароль'**
  String get loginExceptionInvalidCredential;

  /// No description provided for @loginExceptionUserNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Пользователь с таким email не зарегистрирован'**
  String get loginExceptionUserNotFound;

  /// No description provided for @loginExceptionWrongEmail.
  ///
  /// In ru, this message translates to:
  /// **'Неправильный формат e-mail'**
  String get loginExceptionWrongEmail;

  /// No description provided for @loginExceptionWrongPassword.
  ///
  /// In ru, this message translates to:
  /// **'Неправильный логин и/или пароль'**
  String get loginExceptionWrongPassword;

  /// No description provided for @registrationTitle.
  ///
  /// In ru, this message translates to:
  /// **'Регистрация'**
  String get registrationTitle;

  /// No description provided for @registrationFirstNameFieldTitle.
  ///
  /// In ru, this message translates to:
  /// **'Введите ваше имя:'**
  String get registrationFirstNameFieldTitle;

  /// No description provided for @registrationFirstNameFieldHint.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get registrationFirstNameFieldHint;

  /// No description provided for @registrationLastNameFieldTitle.
  ///
  /// In ru, this message translates to:
  /// **'Введите вашу фамилию:'**
  String get registrationLastNameFieldTitle;

  /// No description provided for @registrationLastNameFieldHint.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия'**
  String get registrationLastNameFieldHint;

  /// No description provided for @registrationEmailFieldTitle.
  ///
  /// In ru, this message translates to:
  /// **'Введите логин:'**
  String get registrationEmailFieldTitle;

  /// No description provided for @registrationEmailFieldHint.
  ///
  /// In ru, this message translates to:
  /// **'e-mail'**
  String get registrationEmailFieldHint;

  /// No description provided for @registrationPasswordFieldTitle.
  ///
  /// In ru, this message translates to:
  /// **'Введите пароль:'**
  String get registrationPasswordFieldTitle;

  /// No description provided for @registrationPasswordFieldHint.
  ///
  /// In ru, this message translates to:
  /// **'пароль'**
  String get registrationPasswordFieldHint;

  /// No description provided for @registrationConfirmPasswordFieldTitle.
  ///
  /// In ru, this message translates to:
  /// **'Повторите введенный пароль:'**
  String get registrationConfirmPasswordFieldTitle;

  /// No description provided for @registrationConfirmPasswordFieldHint.
  ///
  /// In ru, this message translates to:
  /// **'пароль'**
  String get registrationConfirmPasswordFieldHint;

  /// No description provided for @registrationButtonLabel.
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get registrationButtonLabel;

  /// No description provided for @registrationExceptionWeakPassword.
  ///
  /// In ru, this message translates to:
  /// **'Введен слабый пароль при регистрации'**
  String get registrationExceptionWeakPassword;

  /// No description provided for @registrationExceptionWrongEmail.
  ///
  /// In ru, this message translates to:
  /// **'Неправильный формат e-mail'**
  String get registrationExceptionWrongEmail;

  /// No description provided for @registrationExceptionEmailAlreadyUsed.
  ///
  /// In ru, this message translates to:
  /// **'Введенный при регистрации email уже занят'**
  String get registrationExceptionEmailAlreadyUsed;

  /// No description provided for @registrationExceptionNotEqualPasswords.
  ///
  /// In ru, this message translates to:
  /// **'Введенные пороли не совпадают'**
  String get registrationExceptionNotEqualPasswords;

  /// No description provided for @registrationExceptionRateLimit.
  ///
  /// In ru, this message translates to:
  /// **'Слишком много попыток. Подождите несколько минут'**
  String get registrationExceptionRateLimit;

  /// No description provided for @homeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Чаты'**
  String get homeTitle;

  /// No description provided for @homeLogoutLabel.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get homeLogoutLabel;

  /// No description provided for @homeSearchHint.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get homeSearchHint;

  /// No description provided for @homeEmptyInterlocutorsMessage.
  ///
  /// In ru, this message translates to:
  /// **'Не с кем переписываться'**
  String get homeEmptyInterlocutorsMessage;

  /// No description provided for @homeLoadErrorMessage.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось загрузить список чатов'**
  String get homeLoadErrorMessage;

  /// No description provided for @homeChatTileYouLabel.
  ///
  /// In ru, this message translates to:
  /// **'Вы: '**
  String get homeChatTileYouLabel;

  /// No description provided for @homeClearChatLabel.
  ///
  /// In ru, this message translates to:
  /// **'Очистить\nчат'**
  String get homeClearChatLabel;

  /// No description provided for @timeAgoJustNow.
  ///
  /// In ru, this message translates to:
  /// **'Только что'**
  String get timeAgoJustNow;

  /// No description provided for @timeAgoYesterday.
  ///
  /// In ru, this message translates to:
  /// **'Вчера'**
  String get timeAgoYesterday;

  /// No description provided for @timeAgoSeveralMinutes.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{{count} минуту} few{{count} минуты} many{{count} минут} other{{count} минут}} назад'**
  String timeAgoSeveralMinutes(num count);

  /// No description provided for @chatEmptyMessagesPlaceholder.
  ///
  /// In ru, this message translates to:
  /// **'Вы еще не начали переписку...'**
  String get chatEmptyMessagesPlaceholder;

  /// No description provided for @chatTodayDividerLabel.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня'**
  String get chatTodayDividerLabel;

  /// No description provided for @chatStatusOnline.
  ///
  /// In ru, this message translates to:
  /// **'онлайн'**
  String get chatStatusOnline;

  /// No description provided for @chatStatusTyping.
  ///
  /// In ru, this message translates to:
  /// **'печатает...'**
  String get chatStatusTyping;

  /// No description provided for @chatStatusRecentlyOffline.
  ///
  /// In ru, this message translates to:
  /// **'недавно был онлайн'**
  String get chatStatusRecentlyOffline;

  /// No description provided for @chatStatusLongOffline.
  ///
  /// In ru, this message translates to:
  /// **'давно был онлайн'**
  String get chatStatusLongOffline;

  /// No description provided for @chatPickerAccessDeniedNote.
  ///
  /// In ru, this message translates to:
  /// **'Нет доступа к галерее. Разрешите доступ в настройках приложения.'**
  String get chatPickerAccessDeniedNote;

  /// No description provided for @chatPickerOpenSettings.
  ///
  /// In ru, this message translates to:
  /// **'Открыть настройки'**
  String get chatPickerOpenSettings;

  /// No description provided for @chatPickerEmptyAlbumsNote.
  ///
  /// In ru, this message translates to:
  /// **'Нет файлов для выбора'**
  String get chatPickerEmptyAlbumsNote;

  /// No description provided for @chatPickerAllowCameraNote.
  ///
  /// In ru, this message translates to:
  /// **'Разрешите доступ к камере в настройках'**
  String get chatPickerAllowCameraNote;

  /// No description provided for @chatPickerCameraHint.
  ///
  /// In ru, this message translates to:
  /// **'Нажмите для фото'**
  String get chatPickerCameraHint;

  /// No description provided for @chatPickerDone.
  ///
  /// In ru, this message translates to:
  /// **'Готово'**
  String get chatPickerDone;

  /// No description provided for @chatPickerSelectedPrefix.
  ///
  /// In ru, this message translates to:
  /// **'Выбрано'**
  String get chatPickerSelectedPrefix;

  /// No description provided for @chatPickerBack.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get chatPickerBack;

  /// No description provided for @chatPhotoPlaceholder.
  ///
  /// In ru, this message translates to:
  /// **'📷 Фото'**
  String get chatPhotoPlaceholder;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
