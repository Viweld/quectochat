import 'package:shared_ui/src/widgets/ui_kit/app_icon.dart';

/// Каталог SVG-иконок дизайн-системы.
abstract final class AppIcons {
  static const String _basePath = kIconsPath;

  static const String _checkKey = '${_basePath}check.svg';
  static const AppIcon check = AppIcon.asset(_checkKey);

  static const String _checkTwinKey = '${_basePath}check_twin.svg';
  static const AppIcon checkTwin = AppIcon.asset(_checkTwinKey);

  static const String _chevronLeftKey = '${_basePath}chevron_left.svg';
  static const AppIcon chevronLeft = AppIcon.asset(_chevronLeftKey);

  static const String _chevronRightKey = '${_basePath}chevron_right.svg';
  static const AppIcon chevronRight = AppIcon.asset(_chevronRightKey);

  static const String _cleanKey = '${_basePath}clean.svg';
  static const AppIcon clean = AppIcon.asset(_cleanKey);

  static const String _closeKey = '${_basePath}close.svg';
  static const AppIcon close = AppIcon.asset(_closeKey);

  static const String _deleteKey = '${_basePath}delete.svg';
  static const AppIcon delete = AppIcon.asset(_deleteKey);

  static const String _eyeClosedKey = '${_basePath}eye_closed.svg';
  static const AppIcon eyeClosed = AppIcon.asset(_eyeClosedKey);

  static const String _eyeOpenedKey = '${_basePath}eye_opened.svg';
  static const AppIcon eyeOpened = AppIcon.asset(_eyeOpenedKey);

  static const String _familyMemberKey = '${_basePath}family_member.svg';
  static const AppIcon familyMember = AppIcon.asset(_familyMemberKey);

  static const String _loginKey = '${_basePath}login.svg';
  static const AppIcon login = AppIcon.asset(_loginKey);

  static const String _logoutKey = '${_basePath}logout.svg';
  static const AppIcon logout = AppIcon.asset(_logoutKey);

  static const String _menuKey = '${_basePath}menu.svg';
  static const AppIcon menu = AppIcon.asset(_menuKey);

  static const String _messageFilledKey = '${_basePath}message_filled.svg';
  static const AppIcon messageFilled = AppIcon.asset(_messageFilledKey);

  static const String _moreKey = '${_basePath}more.svg';
  static const AppIcon more = AppIcon.asset(_moreKey);

  static const String _paperclipKey = '${_basePath}paperclip.svg';
  static const AppIcon paperclip = AppIcon.asset(_paperclipKey);

  static const String _qrCodeKey = '${_basePath}qr_code.svg';
  static const AppIcon qrCode = AppIcon.asset(_qrCodeKey);

  static const String _sendKey = '${_basePath}send.svg';
  static const AppIcon send = AppIcon.asset(_sendKey);

  static const String _settingKey = '${_basePath}setting.svg';
  static const AppIcon setting = AppIcon.asset(_settingKey);

  static const String _userKey = '${_basePath}user.svg';
  static const AppIcon user = AppIcon.asset(_userKey);

  static const String _userAddKey = '${_basePath}user_add.svg';
  static const AppIcon userAdd = AppIcon.asset(_userAddKey);

  static const String _userSearchKey = '${_basePath}user_search.svg';
  static const AppIcon userSearch = AppIcon.asset(_userSearchKey);
}
