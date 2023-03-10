import 'package:blur/blur.dart';
import 'package:contracts_vault/features/app_navigation/ui/app_navigation.dart';
import 'package:contracts_vault/features/auth/login/login_ui.dart';
import 'register-form-validation/bloc/register_form_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '/../../../features/components/custom_button.dart';
import '/../../../features/components/entry_field.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '/../../../generated/l10n.dart';

class RegistrationUI extends StatefulWidget {
  const RegistrationUI({Key? key}) : super(key: key);

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordAgainController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterFormBloc, FormsValidate>(
          listener: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              errorDialog(context, state);
            } else if (state.isFormValid && !state.isLoading) {
              context.read<RegisterFormBloc>().add(const FormSucceeded());
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
          },
        ),
      ],
      child: CustomScaffold(
        child: Scaffold(
          appBar: AppBar(
            title: Text(s.signUp),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.vertical -
                  AppBar().preferredSize.height,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  emailField(s),
                  passwordField(s),
                  passwordAgainField(s),
                  const Spacer(),
                  signUpButton(context, s),
                ],
              ),
            ),
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
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 24),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        _emailController.clear();
                        _passwordController.clear();
                        _passwordAgainController.clear();
                        // Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginUI(),
                          ),
                        );
                      },
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

  signUpButton(BuildContext context, S s) {
    return BlocBuilder<RegisterFormBloc, FormsValidate>(
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
                      text: s.signUp,
                      padding: const EdgeInsets.all(14),
                      onTap: !state.isFormValid
                          ? () => context
                              .read<RegisterFormBloc>()
                              .add(const FormSubmitted(value: Status.signUp))
                          : null,
                    ),
            ),
          ],
        );
      },
    );
  }

  emailField(S s) {
    return BlocBuilder<RegisterFormBloc, FormsValidate>(
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
            context.read<RegisterFormBloc>().add(EmailChanged(value));
          },
        );
      },
    );
  }

  passwordField(S s) {
    return BlocBuilder<RegisterFormBloc, FormsValidate>(
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
            context.read<RegisterFormBloc>().add(PasswordChanged(value));
          },
        );
      },
    );
  }

  passwordAgainField(S s) {
    return BlocBuilder<RegisterFormBloc, FormsValidate>(
      builder: (context, state) {
        return EntryField(
          color: Colors.white,
          controller: _passwordAgainController,
          label: s.passwordAgain,
          hint: s.enterPasswordAgain,
          maxLines: 1,
          errorText:
              !state.isPasswordAgainValid ? '''şifreler uyuşmuyor''' : null,
          onChanged: (value) {
            context
                .read<RegisterFormBloc>()
                .add(PasswordAgainChanged(state.password, value));
          },
        );
      },
    );
  }
}
