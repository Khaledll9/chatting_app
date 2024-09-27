import 'package:flutter/material.dart';

class CoustomTextField extends StatelessWidget {
  const CoustomTextField(
      {this.onChange,
      required this.filedLabol,
      this.obsucreText = false,
      super.key});
  final String filedLabol;
  final Function(String)? onChange;
  final bool? obsucreText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsucreText!,
      style: const TextStyle(color: Colors.white),
      // ignore: body_might_complete_normally_nullable
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: filedLabol,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 202, 201, 201),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
