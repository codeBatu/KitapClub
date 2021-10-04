import 'package:bookclub/screen/auth/login/login_page_view.dart';
import 'package:bookclub/screen/book/home_screen_view.dart';
import 'package:bookclub/viewmodel/states/currentuser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthStatus { notLoggedIn, loggedIn }

class RootState extends StatefulWidget {
  const RootState({Key? key}) : super(key: key);

  @override
  _RootStateState createState() => _RootStateState();
}

class _RootStateState extends State<RootState> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    CurrentStates _currentstate =
        Provider.of<CurrentStates>(context, listen: false);
    bool result = await _currentstate.onStartUp();
    if (result = true) {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Widget retval;
    switch (_authStatus) {
      case AuthStatus.loggedIn:
        retval = const LoginPageView();
        break;
      case AuthStatus.notLoggedIn:
        retval = const HomePageView();
        break;
    }
    return retval;
  }
}
