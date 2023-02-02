import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/../../../app_config/app_config.dart';
import '/../../../features/language/data/sources/local/language_local_data_source.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale(AppConfig.languageDefault));

  void selectLanguage(String countryCode) {
    emit(Locale(countryCode));
  }

  void getCurrentLanguage() async {
    String currLang = await LanguageLocalDataSource().getCurrentLanguage();
    selectLanguage(currLang);
  }

  void setCurrentLanguage(String langCode) async {
    await LanguageLocalDataSource().setCurrentLanguage(langCode);
    selectLanguage(langCode);
  }
}
