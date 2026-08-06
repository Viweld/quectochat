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
  String get commonRetry => 'Повторить';

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
  String get loginToInviteButtonLabel => 'У меня есть приглашение';

  @override
  String get loginExceptionInvalidCredential => 'Неправильные логин или пароль';

  @override
  String get loginExceptionUserNotFound => 'Пользователь с таким email не зарегистрирован';

  @override
  String get loginExceptionWrongEmail => 'Неправильный формат e-mail';

  @override
  String get loginExceptionWrongPassword => 'Неправильный логин и/или пароль';

  @override
  String get inviteCodeTitle => 'Приглашение';

  @override
  String get inviteCodeSubtitle => 'Введите одноразовый код или отсканируйте QR';

  @override
  String get inviteCodeNextButtonLabel => 'Далее';

  @override
  String get inviteCodeScanQrButtonLabel => 'Сканировать QR';

  @override
  String get inviteCodeInvalid => 'Неверный или просроченный код приглашения';

  @override
  String get inviteCodeExpired => 'Срок действия приглашения истёк';

  @override
  String get inviteCodeUsed => 'Приглашение уже использовано';

  @override
  String get inviteCodeNotFound => 'Приглашение не найдено';

  @override
  String get inviteQrScannerTitle => 'Сканирование QR';

  @override
  String get inviteQrScannerHint => 'Наведите камеру на QR-код приглашения';

  @override
  String get inviteRoleSheetTitle => 'Кого добавить?';

  @override
  String get inviteRoleParent => 'Член семьи — родитель';

  @override
  String get inviteRoleChild => 'Член семьи — ребёнок';

  @override
  String get inviteRoleFriend => 'Друг';

  @override
  String get inviteShareTitle => 'Приглашение';

  @override
  String get inviteShareSubtitle => 'Покажите код или QR новому пользователю';

  @override
  String inviteShareExpiresLabel(Object date) {
    return 'Действует до $date';
  }

  @override
  String get inviteShareCopyHint => 'Код можно ввести вручную в приложении';

  @override
  String nestedFriendsTitle(Object name) {
    return 'Друзья $name';
  }

  @override
  String nestedRelativesTitle(Object name) {
    return 'Родственники $name';
  }

  @override
  String get nestedEmptyMessage => 'Список пуст';

  @override
  String get pinnedRevealLabel => 'Открыть список';

  @override
  String get registrationTitle => 'Регистрация';

  @override
  String get registrationDisplayNameFieldTitle => 'Придумайте псевдоним:';

  @override
  String get registrationDisplayNameFieldHint => 'Как вас будут видеть в чатах';

  @override
  String get registrationEmailFieldTitle => 'Введите логин:';

  @override
  String get registrationEmailFieldHint => 'e-mail';

  @override
  String get registrationPasswordFieldTitle => 'Введите пароль:';

  @override
  String get registrationPasswordFieldHint => 'пароль';

  @override
  String get registrationConfirmPasswordFieldTitle => 'Повторите введенный пароль:';

  @override
  String get registrationConfirmPasswordFieldHint => 'пароль';

  @override
  String get registrationButtonLabel => 'Зарегистрироваться';

  @override
  String get registrationExceptionWeakPassword => 'Введен слабый пароль при регистрации';

  @override
  String get registrationExceptionWrongEmail => 'Неправильный формат e-mail';

  @override
  String get registrationExceptionEmailAlreadyUsed => 'Введенный при регистрации email уже занят';

  @override
  String get registrationExceptionNotEqualPasswords => 'Введенные пороли не совпадают';

  @override
  String get registrationExceptionRateLimit => 'Слишком много попыток. Подождите несколько минут';

  @override
  String get registrationExceptionInvalidInvite => 'Приглашение недействительно';

  @override
  String get homeTitle => 'Чаты';

  @override
  String get homeLogoutLabel => 'Выйти';

  @override
  String get homeSearchHint => 'Поиск';

  @override
  String get homeEmptyInterlocutorsMessage => 'Не с кем переписываться';

  @override
  String get homeLoadErrorMessage => 'Не удалось загрузить список чатов';

  @override
  String get homeChatTileYouLabel => 'Вы: ';

  @override
  String get homeDrawerMenuLabel => 'Меню';

  @override
  String get homeDrawerUnnamedUser => 'Без имени';

  @override
  String get homeDrawerProfileTitle => 'Профиль';

  @override
  String get homeDrawerProfileSubtitle => 'Имя, фамилия и аватар';

  @override
  String get homeDrawerAddUserTitle => 'Добавить пользователя';

  @override
  String get homeDrawerAddUserSubtitle => 'Пригласить собеседника';

  @override
  String get homeDrawerComingSoonMessage => 'Функция скоро появится';

  @override
  String homeDrawerVersionLabel(Object version, Object buildNumber) {
    return 'Версия $version ($buildNumber)';
  }

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

  @override
  String get chatClearChatLabel => 'Очистить чат';

  @override
  String get chatClearChatConfirmTitle => 'Очистить чат?';

  @override
  String get chatClearChatConfirmMessage => 'Вся история переписки будет удалена';

  @override
  String get chatStatusOnline => 'онлайн';

  @override
  String get chatStatusTyping => 'печатает...';

  @override
  String get chatStatusRecentlyOffline => 'недавно был онлайн';

  @override
  String get chatStatusLongOffline => 'давно был онлайн';

  @override
  String get chatPickerAccessDeniedNote =>
      'Нет доступа к галерее. Разрешите доступ в настройках приложения.';

  @override
  String get chatPickerOpenSettings => 'Открыть настройки';

  @override
  String get chatPickerEmptyAlbumsNote => 'Нет файлов для выбора';

  @override
  String get chatPickerAllowCameraNote => 'Разрешите доступ к камере в настройках';

  @override
  String get chatPickerCameraHint => 'Нажмите для фото';

  @override
  String get chatPickerDone => 'Готово';

  @override
  String get chatPickerSelectedPrefix => 'Выбрано';

  @override
  String get chatPickerBack => 'Назад';

  @override
  String get chatPhotoPlaceholder => '📷 Фото';
}
