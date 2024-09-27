import 'package:chating/consntant.dart';
import 'package:chating/helper/helper_fun.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/ganaral_buttom.dart';
import '../widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? name;

  String? email;

  String? password;

  bool isLoding = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.white,
      inAsyncCall: isLoding,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 75,
                ),
                Image.asset(
                  kLogo,
                  height: 100,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sholar Chat',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                const Row(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CoustomTextField(
                  onChange: (data) {
                    name = data;
                  },
                  filedLabol: 'Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CoustomTextField(
                  onChange: (data) {
                    email = data;
                  },
                  filedLabol: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CoustomTextField(
                  obsucreText: true,
                  onChange: (data) {
                    password = data;
                  },
                  filedLabol: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(
                        () {
                          isLoding = true;
                        },
                      );
                      try {
                        await registertion();
                        showSnakbar(context, 'success');
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnakbar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnakbar(context, 'email is already in used');
                        }
                      } catch (e) {
                        showSnakbar(context, 'email is already in used');
                      }
                      setState(() {
                        isLoding = false;
                      });
                    }
                  },
                  buttomName: 'Sign up',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "already have an account",
                      style: TextStyle(
                        color: Color.fromARGB(255, 228, 228, 228),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '    Log in',
                        style: TextStyle(
                          color: Color.fromARGB(255, 199, 237, 230),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  Future<void> registertion() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
