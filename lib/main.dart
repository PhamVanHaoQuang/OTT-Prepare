import 'package:flutter/material.dart';
import 'package:ott_prepare/src/presentations/forget_password/forget_password_screen.dart';
import 'package:ott_prepare/src/presentations/login/new_login_screen.dart';
import 'package:ott_prepare/src/presentations/login/login_smart_tv/edit_info_screen.dart';
import 'package:ott_prepare/src/presentations/login/register_screen.dart';
import 'package:ott_prepare/src/presentations/phone_auth/change_password/change_password_screen.dart';
import 'package:ott_prepare/src/presentations/sign_up/sign_up_screen.dart';

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
        '/': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/edit_info': (context) => const EditInformationScreen(),
        '/change_password': (context) => const ChangePasswordScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/forgot_password': (context) => const ForgetPasswordScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SVN-Gilroy'),
    );
  }
}
