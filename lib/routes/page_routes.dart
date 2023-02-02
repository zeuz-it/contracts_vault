import '/../../../features/app_navigation/ui/app_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/../../../features/auth/login_navigator.dart';
import '/../../../routes/app_navigator.dart';

/// [PageRoutes] contains the page routes on the top
class PageRoutes {
  static const String root = "/";
  static const String appNavigator = "/app_navigator";

  static Map<String, WidgetBuilder> routes() {
    return {
      root: (context) => StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    semanticsLabel: "Giriş Yapılıyor",
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Giriş Yapılırken Hata!"),
                );
              } else if (snapshot.hasData) {
                final user = FirebaseAuth.instance.currentUser;
                String? signInProvider;
                for (final providerProfile in user!.providerData) {
                  signInProvider = providerProfile.providerId;
                }
                if (signInProvider == "password" && !user.emailVerified) {
                  /* email ve password ile kayıt olunup giriş yapılmışsa ve email onaylı değilse*/
                  return const LoginNavigator();
                } else {
                  return const AppNavigation();
                }
              } else {
                return const LoginNavigator();
              }
            },
          ),
      appNavigator: (context) => const AppNavigator(),
    };
  }
}
