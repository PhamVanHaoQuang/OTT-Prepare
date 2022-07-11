import 'package:flutter/material.dart';
import 'package:ott_prepare/src/configs/string_extension.dart';
import 'package:ott_prepare/src/widget/button_widget.dart';

import '../../../helper/validate_helper.dart';
import '../../../widget/password_text_field_widget.dart';

enum Status { pure, dirty }

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

  Status testPasswordStatus = Status.pure;
  Status testNewPasswordStatus = Status.pure;
  Status testConfirmPasswordStatus = Status.pure;

  @override
  void initState() {
    super.initState();
    oldPasswordEditingController = TextEditingController();
    newPasswordEditingController = TextEditingController();
    confirmPasswordEditingController = TextEditingController();
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
            errorText: (testPasswordStatus == Status.dirty)
                ? ValidateHelper.validatePassword(
                    oldPasswordEditingController.text)
                : null,
            text: 'Mật khẩu hiện tại',
            passwordVisible: true,
            textEditingController: oldPasswordEditingController,
            onChanged: (value) {
              errorTextPassword = '';
              testPasswordStatus = Status.dirty;
              setState(() {});
            },
          ),
          SizedBox(
            height: size.height * 8 / 896,
          ),
          PasswordTextFieldWidget(
            errorText: (testNewPasswordStatus == Status.dirty)
                ? ValidateHelper.validateNewPassword(
                    newPasswordEditingController.text,
                    oldPasswordEditingController.text)
                : null,
            text: 'Mật khẩu mới',
            passwordVisible: true,
            textEditingController: newPasswordEditingController,
            onChanged: (value) {
              testNewPasswordStatus = Status.dirty;
              setState(() {});
            },
          ),
          SizedBox(
            height: size.height * 8 / 896,
          ),
          PasswordTextFieldWidget(
            errorText: (testConfirmPasswordStatus == Status.dirty)
                ? ValidateHelper.validateConfirmPassword(
                    confirmPasswordEditingController.text,
                    newPasswordEditingController.text)
                : null,
            text: 'Nhập lại mật khẩu mới',
            passwordVisible: true,
            textEditingController: confirmPasswordEditingController,
            onChanged: (value) {
              testConfirmPasswordStatus = Status.dirty;
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
            colorButton: (errorTextPassword == null &&
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
