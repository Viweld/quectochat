import 'package:shared_ui/src/widgets/ui_kit/app_icon.dart';

/// Каталог SVG-иконок дизайн-системы.
abstract final class AppIcons {
  static const String _basePath = kIconsPath;

  static const String _checkKey = '${_basePath}check.svg';
  static const AppIcon check = AppIcon.asset(_checkKey);

  static const String _checkTwinKey = '${_basePath}check_twin.svg';
  static const AppIcon checkTwin = AppIcon.asset(_checkTwinKey);

  static const String _loginKey = '${_basePath}login.svg';
  static const AppIcon login = AppIcon.asset(_loginKey);

  static const String _logoutKey = '${_basePath}logout.svg';
  static const AppIcon logout = AppIcon.asset(_logoutKey);

  static const String _paperclipKey = '${_basePath}paperclip.svg';
  static const AppIcon paperclip = AppIcon.asset(_paperclipKey);

  static const String _sendKey = '${_basePath}send.svg';
  static const AppIcon send = AppIcon.asset(_sendKey);

  static const String _settingKey = '${_basePath}setting.svg';
  static const AppIcon setting = AppIcon.asset(_settingKey);

  static const String _userSearchKey = '${_basePath}user-search.svg';
  static const AppIcon userSearch = AppIcon.asset(_userSearchKey);
}
