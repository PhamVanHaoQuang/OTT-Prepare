import 'package:flutter/material.dart';
import 'package:ott_prepare/src/configs/string_extension.dart';
import 'package:ott_prepare/src/widget/button_widget.dart';

import '../../../widget/password_text_field_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController oldPasswordEditingController;
  late TextEditingController newPasswordEditingController;
  late TextEditingController confirmPasswordEditingController;

  String? errorTextPassword;
  String? errorTextNewPassword;
  String? errorTextConfirmPassword;

  @override
  void initState() {
    super.initState();
    oldPasswordEditingController = TextEditingController(text: '');
    newPasswordEditingController = TextEditingController(text: '');
    confirmPasswordEditingController = TextEditingController(text: '');
  }

  String? validatePassword(String text) {
    if (text.isEmpty) {
      return errorTextPassword = 'Vui lòng nhập mật khẩu hiện tại';
    } else if (text.length < 8) {
      return errorTextPassword = 'Mật khẩu nhập không đủ 8 kí tự';
    }
    return null;
  }

  String? validateNewPassword(String text) {
    if (text.isEmpty) {
      return errorTextNewPassword = 'Vui lòng nhập mật khẩu mới';
    } else if (text.length < 8) {
      return errorTextNewPassword = 'Mật khẩu nhập không đủ 8 kí tự';
    } else if (text == oldPasswordEditingController.text) {
      return errorTextNewPassword = 'Trùng với mật khẩu hiện tại';
    }
    return errorTextNewPassword = null;
  }

  String? validateConfirmPassword(String text) {
    if (text.isEmpty) {
      return errorTextConfirmPassword = 'Vui lòng nhập lại mật khẩu mới';
    } else if (text.length < 8) {
      return errorTextConfirmPassword = 'Mật khẩu nhập không đủ 8 kí tự';
    } else if (text != newPasswordEditingController.text) {
      return errorTextConfirmPassword = 'Mật khẩu nhập lại không đúng';
    }
    return errorTextConfirmPassword = null;
  }

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Đổi mật khẩu',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0x003d3d3d),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 100 / 896,
        left: size.width * 12.3 / 100,
        right: size.width * 12.3 / 100,
      ),
      child: Column(
        children: [
          PasswordTextFieldWidget(
            errorText: errorTextPassword,
            text: 'Mật khẩu hiện tại',
            passwordVisible: true,
            textEditingController: oldPasswordEditingController,
            onChanged: (value) {
              errorTextPassword = '';
              validatePassword(value);
              setState(() {});
            },
          ),
          SizedBox(
            height: size.height * 8 / 896,
          ),
          PasswordTextFieldWidget(
            errorText: errorTextNewPassword,
            text: 'Mật khẩu mới',
            passwordVisible: true,
            textEditingController: newPasswordEditingController,
            onChanged: (value) {
              errorTextNewPassword = null;
              validateNewPassword(value);
              setState(() {});
            },
          ),
          SizedBox(
            height: size.height * 8 / 896,
          ),
          PasswordTextFieldWidget(
            errorText: errorTextConfirmPassword,
            text: 'Nhập lại mật khẩu mới',
            passwordVisible: true,
            textEditingController: confirmPasswordEditingController,
            onChanged: (value) {
              validateConfirmPassword(confirmPasswordEditingController.text);
              setState(() {});
            },
          ),
          SizedBox(
            height: size.height * 87 / 896,
          ),
          ButtonWidget(
            text: 'Xác nhận',
            width: size.width / 2,
            colorText: Colors.white,
            colorButton:
                (validatePassword(oldPasswordEditingController.text) == null &&
                        validateNewPassword(
                              newPasswordEditingController.text,
                            ) ==
                            null &&
                        validateConfirmPassword(
                              confirmPasswordEditingController.text,
                            ) ==
                            null &&
                        errorTextPassword == null &&
                        errorTextNewPassword == null &&
                        errorTextConfirmPassword == null)
                    ? const Color(0xff1EC5F9)
                    : const Color(0xff8C8C8C),
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    oldPasswordEditingController.dispose();
    newPasswordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    super.dispose();
  }
}
