import 'package:flutter/material.dart';

class TexFormField {
  Container utilyTextFormField(String labelText, bool scure) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
        ),
      ),
      child: TextFormField(
        obscureText: scure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: labelText,
          labelText: labelText,
        ),
      ),
    );
  }
}
