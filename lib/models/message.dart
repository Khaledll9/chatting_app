import 'package:chating/consntant.dart';

class Messages {
  final String message;
  final String id;

  Messages({required this.id, required this.message});

  factory Messages.fromJson(jsonData) {
    return Messages(
      message: jsonData[kMessage],
      id: jsonData['id'],
    );
  }
}
