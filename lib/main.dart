import 'package:contracts_vault/features/app_navigation/ui/app_navigation.dart';
import 'package:contracts_vault/features/auth/bloc/auth_bloc.dart';
import 'package:contracts_vault/features/auth/login_navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '/../../../routes/page_routes.dart';
import '/../../../theme/app_theme.dart';
import 'app_bloc_observer.dart';

import 'features/auth/auth_repository_impl.dart';
import 'features/database/bloc/database_bloc.dart';
import 'features/database/database_repository_impl.dart';
import 'features/form-validation/bloc/form_bloc.dart';
import 'features/language/bloc/language_cubit.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(BlocProvider(
  //   create: (context) => LanguageCubit()..getCurrentLanguage(),
  //   child: const MyApp(),
  // ));
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(AuthRepositoryImpl())..add(AuthStarted()),
        ),
        BlocProvider(
          create: (context) =>
              FormBloc(AuthRepositoryImpl(), DatabaseRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => DatabaseBloc(DatabaseRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => LanguageCubit()..getCurrentLanguage(),
        ),
      ],
      child: const MyApp(),
    ),
  );
  /* 
    bu da Bloc'ta meydana gelen herhangi bir değişikliği gözlemlememize izin verecek. 
    Oluşturduğunuz Bloc sınıfıyla ilgili herhangi bir sorunu ayıklamanızı kolaylaştırır.

    Ayrıca giriş işlemleri, form validation ve database işlemleri için bir den fazla 
    bloc kullandığımızdan MultiBlocProvider kullandık.
  */
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
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
        );
      },
    );
  }
}
