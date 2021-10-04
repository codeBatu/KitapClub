import 'package:bookclub/core/compnet/constant.dart';
import 'package:bookclub/screen/auth/register/register_page_view.dart';
import 'package:bookclub/screen/book/home_screen_view.dart';
import 'package:bookclub/viewmodel/states/currentuser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO CURRENTSTATE TEK DÜŞÜR VERİLERİ 1 YERDEN ÇEK
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

  MaterialButton loginButton(
    BuildContext context,
    String bName,
    TextEditingController email,
    TextEditingController password,
  ) {
    return MaterialButton(
      onPressed: () {
        if (email.text == "" || password.text == "") {
          email.text = "";
          password.text = "";
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(" Boş Alan Olamaz"),
            ),
          );
        } else {
          CurrentStates _currentstate =
              Provider.of<CurrentStates>(context, listen: false);

          _currentstate.loginUser(email.text, password.text, context);
          email.text = "";
          password.text = "";
        }
      },
      child: Text(bName),
      color: Colors.orange,
    );
  }

  MaterialButton googleButton(BuildContext context, String bName) {
    return MaterialButton(
        color: Colors.grey,
        child: Text(bName),
        onPressed: () {
          CurrentStates _currentstate =
              Provider.of<CurrentStates>(context, listen: false);
          _currentstate.loginWithGoole();
        });
  }

  MaterialButton singUpButton(
      BuildContext context,
      String bName,
      TextEditingController userName,
      TextEditingController email,
      TextEditingController password,
      TextEditingController confirmPassword) {
    return MaterialButton(
      onPressed: () async {
        if (userName.text == "") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Kullanıcı Adı : Boş Olamaz"),
            ),
          );
        } else {
          if (userName.text.length > 3) {
            if (email.text == "") {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Email   Alanı Boş olamaz"),
                ),
              );
            } else {
              if (password.text == "" || confirmPassword.text == "") {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Şifre:${password.text}\nŞifre: ${confirmPassword.text} \nŞifre Alanlar Boş olamaz"),
                  ),
                );
              } else {
                if (password.text == confirmPassword.text) {
                  if (password.text.length < 5) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Şifre :${password.text} \n 5 karekterden az olamaz"),
                      ),
                    );
                  } else {
                    CurrentStates _currentstate =
                        Provider.of<CurrentStates>(context, listen: false);
                    try {
                      _currentstate.singUpUser(
                          email.text, password.text, userName.text);
                      //  userName.text = "";
                      //  email.text = "";
                      //  password.text = "";
                      //  confirmPassword.text = "";
                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$e"),
                      ));
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "${password.text} ${confirmPassword.text}  Uyuşmuyor"),
                    ),
                  );
                }
              }
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "Kullanıcı Adı :${userName.text}\n4 Karekterden Küçük Olamaz"),
              ),
            );
          }
        }
      },
      child: Text(bName),
      color: Colors.orange,
    );
  }
}
