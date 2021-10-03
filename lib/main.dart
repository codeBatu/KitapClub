import 'package:bookclub/screen/auth/login/login_page_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
