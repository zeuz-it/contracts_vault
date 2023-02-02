import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/../../../app_config/app_config.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '/../../../features/language/bloc/language_cubit.dart';
import '/../../../generated/l10n.dart';

class LanguageSheet extends StatefulWidget {
  const LanguageSheet({Key? key}) : super(key: key);

  @override
  _LanguageSheetState createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  late LanguageCubit _languageCubit;

  String? selectedLocale;

  @override
  void initState() {
    super.initState();
    _languageCubit = context.read<LanguageCubit>()..getCurrentLanguage();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CustomScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).changeLanguage),
        ),
        body: BlocBuilder<LanguageCubit, Locale>(
          builder: (context, currentLocale) {
            selectedLocale ??= currentLocale.languageCode;
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
              physics: const BouncingScrollPhysics(),
              itemCount: AppConfig.languagesSupported.length,
              itemBuilder: (context, index) {
                var langCode =
                    AppConfig.languagesSupported.keys.elementAt(index);
                return Container(
                  decoration: BoxDecoration(
                    color: theme.primaryColorLight.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  padding: const EdgeInsets.all(4),
                  child: RadioListTile(
                    title: Text(AppConfig.languagesSupported[langCode]!),
                    value: langCode,
                    groupValue: selectedLocale,
                    onChanged: (langCode) async {
                      setState(() {
                        selectedLocale = langCode as String;
                      });
                    },
                    activeColor: Colors.lightGreenAccent,
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          child: const Icon(Icons.check, size: 24),
          onPressed: () async {
            _languageCubit.setCurrentLanguage(selectedLocale!);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
