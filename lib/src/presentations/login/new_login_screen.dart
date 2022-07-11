import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/string_extension.dart';
import '../../widget/button_widget.dart';
import '../../widget/list_icon_widget.dart';
import '../../widget/password_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController passwordEditingController;
  String? errorTextPassword;
  @override
  void initState() {
    super.initState();
    passwordEditingController = TextEditingController(text: '');
  }

  String? validatePassword(String text) {
    if (text.isEmpty) {
      return errorTextPassword = 'Vui lòng nhập mật khẩu hiện tại';
    } else if (text.length < 8) {
      return errorTextPassword = 'Mật khẩu nhập không đủ 8 kí tự';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    const String errorTextPhone = '';
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0x003d3d3d),
        elevation: 0,
        leading: InkWell(
          child: const SizedBox(
            height: 40,
            width: 40,
            child: Center(
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color(0x003d3d3d),
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 12.3 / 100,
          right: size.width * 12.3 / 100,
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 6 / 100, bottom: size.height * 12 / 100),
            child: SvgPicture.asset(
              'assets/icons/svgs/logo_mcv_go.svg',
              height: size.height * 5 / 100,
              width: size.width * 29 / 100,
            ),
          ),
          Row(
            children: const [
              SizedBox(
                width: 16,
              ),
              Text(
                'Số điện thoại hoặc email',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            style: const TextStyle(fontSize: 15, color: Colors.white),
            autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                fillColor: const Color(0xff4B4B4B),
                filled: true,
                isDense: true,
                hintText: 'Nhập số điện thoại hoặc email',
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                contentPadding: const EdgeInsets.only(
                  top: 12,
                  left: 16,
                  right: 16,
                  bottom: 12,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xff1EC6F9)))),
          ),
          (errorTextPhone != '')
              ? Row(
                  children: const [
                    SizedBox(
                      width: 16,
                    ),
                    Text('Số điện thoại không hợp lệ',
                        style: TextStyle(
                            color: Color(0xffFF2820),
                            fontWeight: FontWeight.w400,
                            fontSize: 12)),
                  ],
                )
              : const SizedBox(
                  height: 14,
                ),
          const SizedBox(
            height: 10,
          ),
          PasswordTextFieldWidget(
            onChanged: (value) {
              errorTextPassword = null;
              validatePassword(passwordEditingController.text);
              setState(() {});
            },
            text: 'Mật khẩu',
            passwordVisible: true,
            errorText: errorTextPassword,
            textEditingController: passwordEditingController,
          ),
          SizedBox(
            height: size.height * 8 / 896,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/change_password');
                },
                child: const Text(
                  ' Quên mật khẩu',
                  style: TextStyle(
                      color: Color(0xff1EC5F9),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 20 / 896,
          ),
          ButtonWidget(
            text: 'Đăng nhập',
            width: size.width,
            colorText: Colors.white,
            colorButton: const Color(0xff8C8C8C),
            onTap: () {
              Navigator.of(context).pushNamed('/edit_info');
            },
          ),
          const Spacer(),
          const Text(
            'Đăng ký bằng',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          const ListIconWidget(),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bạn chưa có tài khoản?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/sign-up');
                  },
                  child: const Text(
                    ' Đăng ký ',
                    style: TextStyle(
                        color: Color(0xff1EC5F9),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'ngay',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
