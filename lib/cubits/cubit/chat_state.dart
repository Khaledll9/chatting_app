import 'package:chating/models/message.dart';

abstract class ChatState {}

class ChatInitialState extends ChatState {}

class ChatSuccessState extends ChatState {
  List<Messages> message;
  ChatSuccessState({required this.message});
}
