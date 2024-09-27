import 'package:chating/consntant.dart';
import 'package:chating/cubits/cubit/chat_cubit.dart';
import 'package:chating/cubits/login/login_cubit.dart';
import 'package:chating/helper/helper_fun.dart';
import 'package:chating/screens/chat_screen.dart';
import 'package:chating/screens/resgister_screen.dart';
import 'package:chating/widgets/ganaral_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/text_field.dart';

class LogInScreen extends StatelessWidget {
  static String id = 'login Screen';
  String? email;

  String? password;

  bool isLoding = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoding) {
          isLoding = true;
        } else if (state is LoginSuccess) {
          isLoding = false;
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, ChatScreen.id, arguments: email);
        } else if (state is LoginFailure) {
          isLoding = false;
          showSnakbar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
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
                      height: 120,
                    ),
                    Image.asset(
                      kLogo,
                      height: 100,
                    ),
                    const Center(
                      child: Text(
                        'Sholar Chat',
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Log In',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
                      buttomName: 'log in',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context)
                              .loginUser(email: email!, password: password!);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account",
                          style: TextStyle(
                            color: Color.fromARGB(255, 228, 228, 228),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: const Text(
                            '    Sign In',
                            style: TextStyle(
                              color: Color.fromARGB(255, 199, 237, 230),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: kPrimaryColor,
          ),
        );
      },
    );
  }
}
