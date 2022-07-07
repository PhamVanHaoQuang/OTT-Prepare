import 'package:flutter/material.dart';
import 'package:ott_prepare/src/presentations/phone_auth/terms_of_use/teams_of_use_screen.dart';
import 'package:ott_prepare/src/presentations/sign_in/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTT Prepare',
      initialRoute: '/',
      routes: {
        '/': (context) => const SignInScreen(),
        '/teams-of-use': (context) => const TeamsOfUseScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SVN-Gilroy'),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
    );
  }
}
