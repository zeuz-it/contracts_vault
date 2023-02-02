import 'package:blur/blur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isLoading = false;

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
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
                          "Email doğrulama kodu gönderildi",
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

  Future signUp() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      await sendEmailVerification(context);

      setState(() {
        isLoading = false;
      });
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

  bool _emailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

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
    return CustomScaffold(
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  EntryField(
                    controller: _emailController,
                    label: s.emailAddress,
                    hint: s.enterEmailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Lütfen bir email adresi girin.';
                      } else if (!_emailValid(value)) {
                        return 'Lütfen geçerli bir email adresi girin.';
                      }
                    },
                  ),
                  EntryField(
                    controller: _passwordController,
                    label: s.password,
                    hint: s.enterPassword,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Lütfen bir password girin.';
                      }
                    },
                  ),
                  EntryField(
                      controller: _passwordAgainController,
                      label: s.password,
                      hint: s.enterPassword,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Lütfen bir password girin.';
                        }
                        if (value != _passwordController.text) {
                          return 'Şifreler Eşleşmiyor.';
                        }
                      }),
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
                                text: s.signUp,
                                padding: const EdgeInsets.all(14),
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    signUp();
                                  }
                                },
                              ),
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
