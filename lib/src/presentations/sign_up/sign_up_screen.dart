import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../otp/otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscurePassword = true;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: SvgPicture.asset(
            "assets/icons/svgs/ic_back.svg",
            fit: BoxFit.scaleDown,
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Uri _url = Uri.parse('https://mcvgo.vn/dieu-khoan-su-dung.html');
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(
            left: size.width * .08,
            right: size.width * .08,
            top: size.width * .12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Đăng ký",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1EC5F9)),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/icons/svgs/logo_mcv_go.svg",
                    width: size.width * .25,
                  ),
                ],
              ),
              const SizedBox(height: 48),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Số điện thoại",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 1,
                controller: phoneController,
                // obscureText: _isObscurePassword,
                cursorColor: Colors.white,
                keyboardType: TextInputType.phone,
                onChanged: (text) {
                  setState(() {});
                },
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    fillColor: const Color(0xff4B4B4B),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff1EC5F9), width: 1.0),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    helperText: "",
                    hintText: "Nhập số điện thoại",
                    errorText: null,
                    hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/svgs/ic_delete.svg",
                        fit: BoxFit.scaleDown,
                      ),
                      onPressed: () {
                        phoneController.clear();
                        setState(() {});
                      },
                    )),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Mật khẩu",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 1,
                controller: passwordController,
                obscureText: _isObscurePassword,
                cursorColor: Colors.white,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                onChanged: (text) {
                  if (text.length < 8) {
                    errorText = "Mật khẩu không đủ 8 kí tự";
                  } else {
                    errorText = null;
                  }
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  fillColor: const Color(0xff4B4B4B),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff1EC5F9), width: 1.0),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  hintText: "Ít nhất 8 kí tự",
                  hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.5)),
                  helperText: "",
                  errorText: errorText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  suffixIcon: IconButton(
                    icon: (_isObscurePassword)
                        ? Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.white.withOpacity(0.5),
                          )
                        : Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.white.withOpacity(0.5),
                          ),
                    onPressed: () => setState(
                      () {
                        _isObscurePassword = !_isObscurePassword;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    children: [
                      const TextSpan(
                          text:
                              "Bằng việc Tạo tài khoản, bãn đã đồng ý\nvới các "),
                      TextSpan(
                          text: "Điều khoản sử dụng",
                          style: const TextStyle(
                              color: Color(0xFF1EC5F9),
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              if (!await launchUrl(_url)) {}
                            }),
                      const TextSpan(text: " của HTVGo"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: SizedBox(
                  width: 215,
                  height: 40,
                  child: TextButton(
                    onPressed: (phoneController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty &&
                            errorText == null)
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OTPScreen()),
                            );
                          }
                        : null,
                    child: const Text(
                      "Đăng ký",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                    style: ButtonStyle(
                      backgroundColor: (phoneController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty &&
                              errorText == null)
                          ? MaterialStateProperty.all<Color>(
                              const Color(0xff1EC5F9))
                          : MaterialStateProperty.all<Color>(
                              const Color(0xffFFFFFF).withOpacity(0.5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  "Đăng ký bằng",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/svgs/ic_google.svg"),
                  const SizedBox(width: 32),
                  SvgPicture.asset("assets/icons/svgs/ic_facebook.svg"),
                ],
              ),
              const SizedBox(height: 54),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    children: [
                      const TextSpan(text: "Bạn đã có tài khoản? "),
                      TextSpan(
                        text: "Đăng Nhập",
                        style: const TextStyle(
                            color: Color(0xFF1EC5F9),
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(text: " ngay"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
