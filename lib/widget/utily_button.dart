import 'package:bookclub/core/compnet/constant.dart';
import 'package:bookclub/screen/auth/register/register_page_view.dart';
import 'package:flutter/material.dart';

class Button {
  MaterialButton utilButton(String bName, BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (bName == TextName.register) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (x) {
                return const RegisterPageView();
              },
            ),
          );
        } else {}
      },
      child: Text(bName),
      color: Colors.orange,
    );
  }
}
