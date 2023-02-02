import '/../../../app_config/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageLocalDataSource {
  LanguageLocalDataSource._privateConstructor() {
    _initPref();
  }

  static final LanguageLocalDataSource _instance =
      LanguageLocalDataSource._privateConstructor();

  factory LanguageLocalDataSource() {
    return _instance;
  }

  static const String _currentLanguageKey = "key_cur_lang";
  SharedPreferences? _sharedPreferences;

  _initPref() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<String> getCurrentLanguage() async {
    await _initPref();
    return _sharedPreferences!.getString(_currentLanguageKey) ??
        AppConfig.languageDefault;
  }

  Future<void> setCurrentLanguage(String langCode) async {
    await _initPref();
    await _sharedPreferences!.setString(_currentLanguageKey, langCode);
  }
}
