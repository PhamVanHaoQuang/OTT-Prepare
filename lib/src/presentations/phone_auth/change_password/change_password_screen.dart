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

  // final _globalFormKey = GlobalKey<FormState>();
  //AutovalidateMode? _autoValidate = AutovalidateMode.disabled;

  Color colorButton = const Color(0xff8C8C8C);
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

  bool validatePassword(TextEditingController text, String? errorText) {
    if (text.text.isEmpty) {
      errorText = 'Vui lòng nhập mật khẩu hiện tại';
      return false;
    } else if (text.text.length < 8) {
      errorText = 'Mật khẩu nhập không đủ 8 kí tự';
      return false;
    }
    return true;
  }

  bool validateNewPassword(TextEditingController text, String? errorText) {
    if (text.text.isEmpty) {
      errorText = 'Vui lòng nhập mật khẩu mới';
      return false;
    } else if (text.text.length < 8) {
      errorText = 'Mật khẩu nhập không đủ 8 kí tự';
      return false;
    } else if (text.text == oldPasswordEditingController.text) {
      errorText = 'Trùng với mật khẩu hiện tại';
      return false;
    }
    return true;
  }

  bool validateConfirmPassword(TextEditingController text, String? errorText) {
    if (text.text.isEmpty) {
      errorText = 'Vui lòng nhập lại mật khẩu mới';
      return false;
    } else if (text.text.length < 8) {
      errorText = 'Mật khẩu nhập không đủ 8 kí tự';
      return false;
    } else if (text.text != newPasswordEditingController.text) {
      errorText = 'Mật khẩu nhập lại không đúng';
      return false;
    }
    return true;
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
              // validatePassword(oldPasswordEditingController, errorTextPassword);

              if (value.isEmpty) {
                errorTextPassword = 'Vui lòng nhập mật khẩu hiện tại';
              } else if (value.length < 8) {
                errorTextPassword = 'Mật khẩu nhập không đủ 8 kí tự';
              } else {
                errorTextPassword = null;
              }

              setState(() {});
            },

            // validator: (val) {
            //   if (Util.isNullOrEmpty(val)) {
            //     return 'Vui lòng nhập mật khẩu hiện tại';
            //   } else if (val!.isLessThen8) {
            //     return 'Mật khẩu nhập không đủ 8 kí tự';
            //   }
            //   return onChangedOldPassword = null;
            // },
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
              if (value.isEmpty) {
                errorTextNewPassword = 'Vui lòng nhập mật khẩu mới';
              } else if (value.length < 8) {
                errorTextNewPassword = 'Mật khẩu nhập không đủ 8 kí tự';
              } else if (value == oldPasswordEditingController.text) {
                errorTextNewPassword = 'Trùng với mật khẩu hiện tại';
              } else {
                errorTextNewPassword = null;
              }

              setState(() {});
            },
            // validator: (val) {
            //   if (Util.isNullOrEmpty(val)) {
            //     return 'Vui lòng nhập mật khẩu mới';
            //   } else if (val!.isLessThen8) {
            //     return 'Mật khẩu nhập không đủ 8 kí tự';
            //   } else if (val == oldPasswordEditingController.text) {
            //     return 'Trùng với mật khẩu hiện tại';
            //   }
            //   return null;
            // },
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
              if (value.isEmpty) {
                errorTextConfirmPassword = 'Vui lòng nhập lại mật khẩu mới';
              } else if (value.length < 8) {
                errorTextConfirmPassword = 'Mật khẩu nhập không đủ 8 kí tự';
              } else if (value != newPasswordEditingController.text) {
                errorTextConfirmPassword = 'Mật khẩu nhập lại không đúng';
              } else {
                errorTextConfirmPassword = null;
              }

              setState(() {});
            },
            // validator: (val) {
            //   if (Util.isNullOrEmpty(val)) {
            //     return 'Vui lòng nhập lại mật khẩu mới';
            //   } else if (val!.isLessThen8) {
            //     return 'Mật khẩu nhập không đủ 8 kí tự';
            //   } else if (val != newPasswordEditingController.text) {
            //     return 'Mật khẩu nhập lại không đúng';
            //   }
            //   return null;
            // },
          ),
          SizedBox(
            height: size.height * 87 / 896,
          ),
          ButtonWidget(
            text: 'Xác nhận',
            width: size.width / 2,
            colorText: Colors.white,
            colorButton: (validatePassword(
                        oldPasswordEditingController, errorTextPassword) &&
                    validateNewPassword(
                        newPasswordEditingController, errorTextNewPassword) &&
                    validateConfirmPassword(confirmPasswordEditingController,
                        errorTextConfirmPassword) &&
                    // oldPasswordEditingController !=
                    //     newPasswordEditingController &&
                    // newPasswordEditingController ==
                    //     confirmPasswordEditingController &&
                    errorTextPassword == '' &&
                    errorTextNewPassword == '' &&
                    errorTextConfirmPassword == '')
                ? const Color(0xff1EC5F9)
                : const Color(0xff8C8C8C),
            onTap: () {
              //Form.of(context)!.validate();
              FocusManager.instance.primaryFocus?.unfocus();

              // final isValidate = _globalFormKey.currentState?.validate();

              // print(isValidate);

              // if (isValidate ?? true) {
              //   setState(() {
              //     colorButton = const Color(0xff1EC5F9);
              //   });
              // } else {
              //   setState(() {
              //     _autoValidate = AutovalidateMode.onUserInteraction;
              //   });
              // }
              //   _globalFormKey.currentState?.save();
              // }else{
              //   setState(() {

              //   });
              // }
            },
          ),
        ],
      ),
    );
    print(errorTextPassword.toString());
  }

  @override
  void dispose() {
    oldPasswordEditingController.dispose();
    newPasswordEditingController.dispose();
    confirmPasswordEditingController.dispose();

    super.dispose();
  }
}
