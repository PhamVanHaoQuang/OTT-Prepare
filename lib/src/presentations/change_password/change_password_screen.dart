import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ott_prepare/src/success_screen/success_screen.dart';

import '../../widget/password_text_field_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  // bool _isShowPassword = false;
  // bool _isShowConfirmPassword = false;

  String? errorTextNewPassword;
  String? errorTextConfirmPassword;

  @override
  void initState() {
    super.initState();
    //  oldPasswordEditingController = TextEditingController(text: '');
    newPasswordController;
    confirmPasswordController;
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? validateNewPassword(String text) {
    if (text.isEmpty) {
      return errorTextNewPassword = 'Vui lòng nhập mật khẩu mới';
    } else if (text.length < 8) {
      return errorTextNewPassword = 'Mật khẩu nhập không đủ 8 kí tự';
    }
    return errorTextNewPassword = null;
  }

  String? validateConfirmPassword(String text) {
    if (text.isEmpty) {
      return errorTextConfirmPassword = 'Vui lòng nhập lại mật khẩu mới';
    } else if (text.length < 8) {
      return errorTextConfirmPassword = 'Mật khẩu nhập không đủ 8 kí tự';
    } else if (text != newPasswordController.text) {
      return errorTextConfirmPassword = 'Mật khẩu nhập lại không đúng';
    }
    return errorTextConfirmPassword = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              "assets/icons/svgs/ic_back.svg",
              fit: BoxFit.scaleDown,
            ),
          ),
          title: const Text(
            "Đặt lại mật khẩu",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.black,
          elevation: 1,
          shadowColor: Colors.white,
        ),
        backgroundColor: Colors.black,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(
          left: size.width * .078,
          right: size.width * .078,
          top: size.width * .12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 24 / 896),
            PasswordTextFieldWidget(
              errorText: errorTextNewPassword,
              text: 'Mật khẩu mới',
              passwordVisible: true,
              textEditingController: newPasswordController,
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
              textEditingController: confirmPasswordController,
              onChanged: (value) {
                validateConfirmPassword(value);
                setState(() {});
              },
            ),
            SizedBox(
              height: size.height * 87 / 896,
            ),
            Center(
              child: SizedBox(
                height: size.height * 40 / 896,
                width: size.width * 215 / 414,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessScreen(
                          title: "Đổi mật khẩu thành công",
                          buttonTitle: "OK",
                          onPressed: () => setState(() {}),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Xác nhận",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffFFFFFF).withOpacity(0.5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
