import 'package:chating/consntant.dart';
import 'package:chating/cubits/cubit/chat_state.dart';
import 'package:chating/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageController);

  ChatCubit() : super(ChatInitialState());

  void sendMessage({required String data, required String email}) {
    messages.add(
      {
        kMessage: data,
        kCreateAt: DateTime.now(),
        'id': email,
      },
    );
  }

  void getMessage() {
    messages.orderBy(kCreateAt, descending: true).snapshots().listen(
      (event) {
        List<Messages> messageList = [];
        for (var doc in event.docs) {
          messageList.add(Messages.fromJson(doc));
        }
        emit(ChatSuccessState(message: messageList));
      },
    );
  }
}
