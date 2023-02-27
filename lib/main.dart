import 'package:contracts_vault/features/auth/bloc/auth_bloc.dart';
import 'package:contracts_vault/features/auth/data/repositories/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '/../../../routes/page_routes.dart';
import '/../../../theme/app_theme.dart';

import 'features/language/bloc/language_cubit.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    create: (context) => LanguageCubit()..getCurrentLanguage(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return RepositoryProvider(
          create: (context) => AuthRepository(),
          child: BlocProvider(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.darkTheme,
              locale: locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              initialRoute: PageRoutes.root,
              routes: PageRoutes.routes(),
            ),
          ),
        );
        /* 
          Kullanıcı arayüzünde(UI) AuthRepository'ye erişmek için MaterialApp'i 
          RepositoryProvider ile sarmamız gerekir.

          Ayrıca Bloc'un State'lerine ve Event'larına(Olaylarına) erişmek için MaterialApp'i 
          BlocProvider ile sarmamız gerekir.
        */ 
      },
    );
  }
}
