import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoding());

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    }
    //  on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     emit(LoginFailure(errorMessage: 'user not found'));
    //   } else if (e.code == 'wrong-password') {
    //     emit(LoginFailure(errorMessage: 'wrong password'));
    //   }
    // }
    catch (e) {
      emit(LoginFailure(errorMessage: 'there was an error, try again'));
    }
  }
}
