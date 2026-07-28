// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get commonOk => 'Ок';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonEmptyFieldError => 'Поле не может быть пустым';

  @override
  String get commonRequestError => 'Ошибка при выполнении запроса';

  @override
  String get toastNetworkError => 'Нет соединения с сетью';

  @override
  String get toastServerError => 'Ошибка сервера. Попробуйте позже';

  @override
  String get toastAuthError => 'Ошибка авторизации';

  @override
  String get toastUnexpectedError => 'Произошла непредвиденная ошибка';

  @override
  String get toastGenericError => 'Что-то пошло не так';

  @override
  String get loginTitle => 'Вход';

  @override
  String get loginEmailFieldTitle => 'Введите логин:';

  @override
  String get loginEmailFieldHint => 'e-mail';

  @override
  String get loginPasswordFieldTitle => 'Введите пароль:';

  @override
  String get loginPasswordFieldHint => 'пароль';

  @override
  String get loginButtonLabel => 'Войти';

  @override
  String get loginToRegistrationButtonLabel => 'Зарегистрироваться';

  @override
  String get loginExceptionInvalidCredential => 'Неправильные логин или пароль';

  @override
  String get loginExceptionUserNotFound =>
      'Пользователь с таким email не зарегистрирован';

  @override
  String get loginExceptionWrongEmail => 'Неправильный формат e-mail';

  @override
  String get loginExceptionWrongPassword => 'Неправильный логин и/или пароль';

  @override
  String get registrationTitle => 'Регистрация';

  @override
  String get registrationFirstNameFieldTitle => 'Введите ваше имя:';

  @override
  String get registrationFirstNameFieldHint => 'Имя';

  @override
  String get registrationLastNameFieldTitle => 'Введите вашу фамилию:';

  @override
  String get registrationLastNameFieldHint => 'Фамилия';

  @override
  String get registrationEmailFieldTitle => 'Введите логин:';

  @override
  String get registrationEmailFieldHint => 'e-mail';

  @override
  String get registrationPasswordFieldTitle => 'Введите пароль:';

  @override
  String get registrationPasswordFieldHint => 'пароль';

  @override
  String get registrationConfirmPasswordFieldTitle =>
      'Повторите введенный пароль:';

  @override
  String get registrationConfirmPasswordFieldHint => 'пароль';

  @override
  String get registrationButtonLabel => 'Зарегистрироваться';

  @override
  String get registrationExceptionWeakPassword =>
      'Введен слабый пароль при регистрации';

  @override
  String get registrationExceptionWrongEmail => 'Неправильный формат e-mail';

  @override
  String get registrationExceptionEmailAlreadyUsed =>
      'Введенный при регистрации email уже занят';

  @override
  String get registrationExceptionNotEqualPasswords =>
      'Введенные пороли не совпадают';

  @override
  String get homeTitle => 'Чаты';

  @override
  String get homeLogoutLabel => 'Выйти';

  @override
  String get homeSearchHint => 'Поиск';

  @override
  String get homeEmptyInterlocutorsMessage => 'Не с кем переписываться';

  @override
  String get homeChatTileYouLabel => 'Вы: ';

  @override
  String get timeAgoJustNow => 'Только что';

  @override
  String get timeAgoYesterday => 'Вчера';

  @override
  String timeAgoSeveralMinutes(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count минут',
      many: '$count минут',
      few: '$count минуты',
      one: '$count минуту',
    );
    return '$_temp0 назад';
  }

  @override
  String get chatEmptyMessagesPlaceholder => 'Вы еще не начали переписку...';

  @override
  String get chatTodayDividerLabel => 'Сегодня';
}
