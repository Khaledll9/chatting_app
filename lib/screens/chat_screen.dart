import 'package:chating/consntant.dart';
import 'package:chating/cubits/cubit/chat_cubit.dart';
import 'package:chating/cubits/cubit/chat_state.dart';
import 'package:chating/models/message.dart';
import 'package:chating/widgets/buble_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'chatScreen';
  List<Messages> mesaageList = [];

  final _controller = ScrollController();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: const Color(0xffA076F9),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 60,
            ),
            const Text(
              'chat',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:
                BlocConsumer<ChatCubit, ChatState>(listener: (context, state) {
              if (state is ChatSuccessState) {
                mesaageList = state.message;
              }
            }, builder: (context, state) {
              return ListView.builder(
                reverse: true,
                controller: _controller,
                itemCount: mesaageList.length,
                itemBuilder: (context, index) {
                  return mesaageList[index].id == email
                      ? ChatBuble(message: mesaageList[index])
                      : ChatBubleForFriend(message: mesaageList[index]);
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: controller,
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(data: value, email: email);
                controller.clear();
                _controller.animateTo(
                  0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.linear,
                );
              },
              decoration: InputDecoration(
                hintText: 'Send message',
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: const Icon(Icons.disabled_by_default_outlined),
                  color: kPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
