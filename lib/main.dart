import 'package:chating/cubits/cubit/chat_cubit.dart';
import 'package:chating/cubits/login/login_cubit.dart';
import 'package:chating/cubits/regester/regester_cubit.dart';
import 'package:chating/screens/chat_screen.dart';
import 'package:chating/screens/log_in.dart';
import 'package:chating/screens/resgister_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SholarChat());
}

class SholarChat extends StatelessWidget {
  const SholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegesterCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          LogInScreen.id: (context) => LogInScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: LogInScreen.id,
      ),
    );
  }
}
 //  MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (context) => LoginCubit(),
    //     ),
    //     BlocProvider(
    //       create: (context) => RegesterCubit(),
    //     ),
    //     // BlocProvider(
    //     //   create: (context) => ChatCubit(),
    //     // ),
    //   ],