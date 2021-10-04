import 'package:bookclub/screen/auth/login/login_page_view.dart';
import 'package:bookclub/viewmodel/states/currentuser.dart';
import 'package:bookclub/viewmodel/status/auth_status.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CurrentStates();
      },
      child: const MaterialApp(
        home: RootState(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
