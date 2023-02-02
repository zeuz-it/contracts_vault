import 'package:blur/blur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/../../../features/components/custom_button.dart';
import '/../../../features/components/entry_field.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '/../../../features/language/ui/language_sheet.dart';
import '/../../../generated/assets.dart';
import '/../../../generated/l10n.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../login_navigator.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  Future signIn() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      setState(() {
        isLoading = false;
      });

      final user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        FirebaseAuth.instance.signOut();
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Flexible(
                          child: Text(
                            "Lütfen email adresinizi doğrulayın, gereksiz kutusuna bakmayı unutmaıyn.",
                            style: TextStyle(color: Colors.red, fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Ok"),
                        ),
                      ],
                    ),
                  ],
                ),
              ).frosted(
                frostColor: Theme.of(context).hintColor,
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                borderRadius: BorderRadius.circular(18),
              ),
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          e.message.toString() + e.code.toString(),
                          style:
                              const TextStyle(color: Colors.red, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Ok"),
                      ),
                    ],
                  ),
                ],
              ),
            ).frosted(
              frostColor: Theme.of(context).hintColor,
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              borderRadius: BorderRadius.circular(18),
            ),
          );
        },
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  Future signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // if(userCredential.user != null){
        //   if(userCredential.additionalUserInfo!.isNewUser){}
        // }
      }
    } on FirebaseAuthException catch (e) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          e.message.toString() + e.code.toString(),
                          style:
                              const TextStyle(color: Colors.red, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Ok"),
                      ),
                    ],
                  ),
                ],
              ),
            ).frosted(
              frostColor: Theme.of(context).hintColor,
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              borderRadius: BorderRadius.circular(18),
            ),
          );
        },
      );
    }
  }

  Future signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          e.message.toString() + e.code.toString(),
                          style:
                              const TextStyle(color: Colors.red, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Ok"),
                      ),
                    ],
                  ),
                ],
              ),
            ).frosted(
              frostColor: Theme.of(context).hintColor,
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              borderRadius: BorderRadius.circular(18),
            ),
          );
        },
      );
    }
  }

  bool _emailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String isoCode = "+91";

  @override
  void initState() {
    super.initState();
    _showLanguageSheet();
  }

  _showLanguageSheet() {
    Future.delayed(
      const Duration(milliseconds: 100),
      () => showModalBottomSheet(
        context: context,
        builder: (context) => const LanguageSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(flex: 2),
                  // Image.asset(Assets.imagesLogo, scale: 1),
                  const SizedBox(
                    width: 200,
                    height: 200,
                    child: Image(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  EntryField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Lütfen bir email adresi girin.';
                      } else if (!_emailValid(value)) {
                        return 'Lütfen geçerli bir email adresi girin.';
                      }
                    },
                    controller: _emailController,
                    label: s.emailAddress,
                    hint: s.enterEmailAddress,
                    maxLines: 1,
                  ),
                  EntryField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Lütfen bir password girin.';
                      }
                    },
                    controller: _passwordController,
                    label: s.password,
                    hint: s.enterPassword,
                    maxLines: 1,
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: isLoading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Loading..."),
                                  SizedBox(width: 10),
                                  CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            : CustomButton(
                                padding: const EdgeInsets.all(14),
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    signIn();
                                  }
                                },
                              ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  /* Sign Up*/
                  CustomButton(
                    padding: const EdgeInsets.all(0),
                    color: Colors.transparent,
                    text: S.of(context).signUp,
                    onTap: () => Navigator.pushNamed(
                      context,
                      LoginRoutes.registration,
                      arguments: '',
                    ),
                  ),
                  const Spacer(),
                  Text(
                    S.of(context).orContinueWith,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CustomButton(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                            width: MediaQuery.of(context).size.width / 3,
                            fontSize: 12,
                            text: S.of(context).facebook,
                            image: Assets.iconsFacebook,
                            color: theme.primaryColorLight,
                            textColor: theme.primaryColorDark,
                            onTap: () => signInWithFacebook(context),
                            // onTap: (){},
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                            width: MediaQuery.of(context).size.width / 3,
                            fontSize: 12,
                            text: S.of(context).google,
                            image: Assets.iconsGoogle,
                            color: theme.primaryColorLight,
                            textColor: theme.primaryColorDark,
                            onTap: () => signInWithGoogle(context),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomButton(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                            width: MediaQuery.of(context).size.width / 3,
                            fontSize: 12,
                            text: S.of(context).phone,
                            image: Assets.iconsPhone,
                            color: theme.primaryColorLight,
                            textColor: theme.primaryColorDark,
                            onTap: () {},
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                            width: MediaQuery.of(context).size.width / 3,
                            fontSize: 12,
                            text: S.of(context).apple,
                            image: Assets.iconsApple,
                            color: theme.primaryColorLight,
                            textColor: theme.primaryColorDark,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
