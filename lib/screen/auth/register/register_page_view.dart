import 'package:bookclub/core/compnet/constant.dart';

import 'package:bookclub/widget/utily_button.dart';
import 'package:bookclub/widget/utily_texformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  _RegisterPageViewState createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
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
                  const SizedBox(
                    height: 130,
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
                          TexFormField().utilyTextFormField(
                              TextName.userTextEditingController,
                              TextName.kAdi,
                              false,
                              Icons.person),
                          const SizedBox(
                            height: 20,
                          ),
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
                          const SizedBox(
                            height: 20,
                          ),
                          TexFormField().utilyTextFormField(
                              TextName.confirmPasswordTextEditingController,
                              TextName.pwd,
                              true,
                              Icons.lock),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Button().singUpButton(
                                  context,
                                  TextName.register,
                                  TextName.userTextEditingController,
                                  TextName.emailTextEditingController,
                                  TextName.passwordTextEditingController,
                                  TextName
                                      .confirmPasswordTextEditingController),
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
