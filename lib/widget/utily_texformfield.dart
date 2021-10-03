import 'package:flutter/material.dart';

class TexFormField {
  Container utilyTextFormField(TextEditingController textController, labelText,
      bool scure, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: textController,
        obscureText: scure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          hintText: labelText,
          labelText: labelText,
        ),
      ),
    );
  }
}
