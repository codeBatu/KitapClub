import 'package:bookclub/core/compnet/constant.dart';
import 'package:bookclub/widget/logo.dart';
import 'package:bookclub/widget/utily_button.dart';
import 'package:bookclub/widget/utily_texformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Logo().logoWigdet(TextName.uiLogo),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Login Yazısı  Text(
                          //     TextName.login,
                          //     style: const TextStyle(
                          //       fontSize: 35,
                          //     ),
                          //   ),
                          TexFormField().utilyTextFormField(
                              TextName.emailTextEditingController,
                              TextName.mail,
                              false,
                              Icons.alternate_email),
                          const SizedBox(
                            height: 20,
                          ),
                          TexFormField().utilyTextFormField(
                              TextName.passwordTextEditingController,
                              TextName.pwd,
                              true,
                              Icons.lock),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Button().loginButton(
                                  context,
                                  TextName.login,
                                  TextName.emailTextEditingController,
                                  TextName.passwordTextEditingController),
                              const SizedBox(
                                width: 20,
                              ),
                              Button().utilButton(TextName.register, context)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
