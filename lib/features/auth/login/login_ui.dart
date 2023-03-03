import 'package:contracts_vault/features/app_navigation/ui/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '/../../../features/components/custom_button.dart';
import '/../../../features/components/entry_field.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '/../../../features/language/ui/language_sheet.dart';
import '/../../../generated/assets.dart';
import '/../../../generated/l10n.dart';

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
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              // Navigating to the dashboard screen if the user is authenticated
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppNavigation()));
            }
            if (state is AuthError) {
              // Showing the error message if the user has entered invalid credentials
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              return SingleChildScrollView(
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
                          color: Colors.white,
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
                          color: Colors.white,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          // signIn();
                                          _authenticateWithEmailAndPassword(
                                              context);
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
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 10, 16, 12),
                                  width: MediaQuery.of(context).size.width / 3,
                                  fontSize: 12,
                                  text: S.of(context).facebook,
                                  image: Assets.iconsFacebook,
                                  color: theme.primaryColorLight,
                                  textColor: theme.primaryColorDark,
                                  onTap: () =>
                                      _authenticateWithFacebook(context),
                                  // onTap: (){},
                                ),
                                const SizedBox(height: 16),
                                CustomButton(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 10, 16, 12),
                                  width: MediaQuery.of(context).size.width / 3,
                                  fontSize: 12,
                                  text: S.of(context).google,
                                  image: Assets.iconsGoogle,
                                  color: theme.primaryColorLight,
                                  textColor: theme.primaryColorDark,
                                  onTap: () => _authenticateWithGoogle(context),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CustomButton(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 10, 16, 12),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 10, 16, 12),
                                  width: MediaQuery.of(context).size.width / 3,
                                  fontSize: 12,
                                  text: S.of(context).apple,
                                  image: Assets.iconsApple,
                                  color: theme.primaryColorLight,
                                  textColor: theme.primaryColorDark,
                                  onTap: () => _authenticateWithApple(context),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

  void _authenticateWithFacebook(context) {
    BlocProvider.of<AuthBloc>(context).add(
      FacebookSignInRequested(),
    );
  }

  void _authenticateWithApple(context) {
    BlocProvider.of<AuthBloc>(context).add(
      AppleSignInRequested(),
    );
  }
}
