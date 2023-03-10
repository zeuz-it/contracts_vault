import 'package:blur/blur.dart';
import 'package:contracts_vault/features/app_navigation/ui/app_navigation.dart';
import 'login-form-validation/bloc/login_form_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '/../../../features/components/custom_button.dart';
import '/../../../features/components/entry_field.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '/../../../features/language/ui/language_sheet.dart';
import '/../../../generated/assets.dart';
import '/../../../generated/l10n.dart';
import '../bloc/auth_bloc.dart';

import '../login_navigator.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  // final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
        body: MultiBlocListener(
          listeners: [
            BlocListener<LoginFormBloc, FormsValidate>(
              listener: (context, state) {
                if (state.errorMessage.isNotEmpty) {
                  errorDialog(context, state);
                } else if (state.isFormValid && !state.isLoading) {
                  context.read<AuthBloc>().add(AuthStarted());
                } else if (state.isFormValidateFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please fill the data correctly!")));
                }
              },
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const AppNavigation()),
                      (Route<dynamic> route) => false);
                }
                if (state is AuthError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
            ),
          ],
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.95,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    // child: Form(
                    // key: _formKey,
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
                        emailField(s),
                        passwordField(s),
                        const Spacer(),
                        signInButton(context),
                        const Spacer(),
                        signUpButton(context),
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
                                facebookButton(context, theme),
                                const SizedBox(height: 16),
                                googleButton(context, theme),
                              ],
                            ),
                            Column(
                              children: [
                                phoneButton(context, theme),
                                const SizedBox(height: 16),
                                appleButton(context, theme),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> errorDialog(BuildContext context, FormsValidate state) {
    return showDialog<void>(
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
                        state.errorMessage.toString(),
                        style: const TextStyle(color: Colors.red, fontSize: 24),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Red"),
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

  signInButton(BuildContext context) {
    return BlocBuilder<LoginFormBloc, FormsValidate>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: state.isLoading
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
                      onTap: !state.isFormValid
                          ? () => context
                              .read<LoginFormBloc>()
                              .add(const FormSubmitted(value: Status.signIn))
                          : null,
                    ),
            ),
          ],
        );
      },
    );
  }

  emailField(S s) {
    return BlocBuilder<LoginFormBloc, FormsValidate>(
      builder: (context, state) {
        return EntryField(
          color: Colors.white,
          controller: _emailController,
          label: s.emailAddress,
          hint: s.enterEmailAddress,
          maxLines: 1,
          errorText: !state.isEmailValid
              ? '''Please ensure the email entered is valid'''
              : null,
          onChanged: (value) {
            context.read<LoginFormBloc>().add(EmailChanged(value));
          },
        );
      },
    );
  }

  passwordField(S s) {
    return BlocBuilder<LoginFormBloc, FormsValidate>(
      builder: (context, state) {
        return EntryField(
          color: Colors.white,
          controller: _passwordController,
          label: s.password,
          hint: s.enterPassword,
          maxLines: 1,
          errorText: !state.isPasswordValid
              ? '''Password must be at least 8 characters and contain at least one letter and number'''
              : null,
          onChanged: (value) {
            context.read<LoginFormBloc>().add(PasswordChanged(value));
          },
        );
      },
    );
  }

  CustomButton signUpButton(BuildContext context) {
    return CustomButton(
      padding: const EdgeInsets.all(0),
      color: Colors.transparent,
      text: S.of(context).signUp,
      onTap: () => Navigator.pushNamed(
        context,
        LoginRoutes.registration,
        arguments: '',
      ),
    );
  }

  appleButton(BuildContext context, ThemeData theme) {
    return BlocBuilder<LoginFormBloc, FormsValidate>(
      builder: (context, state) {
        return CustomButton(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
          width: MediaQuery.of(context).size.width / 3,
          fontSize: 12,
          text: S.of(context).apple,
          image: Assets.iconsApple,
          color: theme.primaryColorLight,
          textColor: theme.primaryColorDark,
          onTap: !state.isLoading
              ? () =>
                  BlocProvider.of<AuthBloc>(context).add(AuthStartedWithApple())
              : null,
        );
      },
      /* mail ve şifre ile giriş yapılırken bu apple hesabı ile giriş butonu tıklama olayını pasif yap*/
    );
  }

  phoneButton(BuildContext context, ThemeData theme) {
    return BlocBuilder<LoginFormBloc, FormsValidate>(
      builder: (context, state) {
        return CustomButton(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
          width: MediaQuery.of(context).size.width / 3,
          fontSize: 12,
          text: S.of(context).phone,
          image: Assets.iconsPhone,
          color: theme.primaryColorLight,
          textColor: theme.primaryColorDark,
          onTap: !state.isLoading ? () {} : null,
        );
      },
      /* mail ve şifre ile giriş yapılırken bu telefon no ile giriş butonu tıklama olayını pasif yap*/
    );
  }

  googleButton(BuildContext context, ThemeData theme) {
    return BlocBuilder<LoginFormBloc, FormsValidate>(
      builder: (context, state) {
        return CustomButton(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
          width: MediaQuery.of(context).size.width / 3,
          fontSize: 12,
          text: S.of(context).google,
          image: Assets.iconsGoogle,
          color: theme.primaryColorLight,
          textColor: theme.primaryColorDark,
          onTap: !state.isLoading
              ? () => BlocProvider.of<AuthBloc>(context)
                  .add(AuthStartedWithGoogle())
              : null,
          /* mail ve şifre ile giriş yapılırken bu google ile giriş butonu tıklama olayını pasif yap*/
        );
      },
    );
  }

  facebookButton(BuildContext context, ThemeData theme) {
    return BlocBuilder<LoginFormBloc, FormsValidate>(
      builder: (context, state) {
        return CustomButton(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
          width: MediaQuery.of(context).size.width / 3,
          fontSize: 12,
          text: S.of(context).facebook,
          image: Assets.iconsFacebook,
          color: theme.primaryColorLight,
          textColor: theme.primaryColorDark,
          onTap: !state.isLoading
              ? () => BlocProvider.of<AuthBloc>(context)
                  .add(AuthStartedWithFacebook())
              : null,
        );
      },
      /* mail ve şifre ile giriş yapılırken bu facebook hesabı ile giriş butonu tıklama olayını pasif yap*/
    );
  }
}
