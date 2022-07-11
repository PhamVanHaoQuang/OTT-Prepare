import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ott_prepare/src/presentations/forget_password/verify_by_email.dart';
import 'package:ott_prepare/src/presentations/sign_in/sign_up_screen.dart';

import '../otp/otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController phoneForgetPassController = TextEditingController();


  @override
  void initState() {
    super.initState();

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
            "Quên mật khẩu",
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
            left: size.width * .08,
            right: size.width * .08,
            top: size.width * .12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Nhập số điện thoại hoặc email",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 1,
                cursorColor: Colors.white,
                controller: phoneForgetPassController,
                onChanged: (text) {
                  setState(() {});
                },
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
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
                    hintText: "Nhập số điện thoại hoặc email",
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
                        phoneForgetPassController.clear();
                        setState(() {});
                      },
                    )),
              ),
              const SizedBox(height: 66),
              Center(
                child: SizedBox(
                  width: 215,
                  height: 40,
                  child: TextButton(
                    onPressed: (phoneForgetPassController.text.isNotEmpty)
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    (phoneForgetPassController.text.contains("@"))
                                        ? const VerifyByEmail()
                                        : const OTPScreen(),
                              ),
                            );
                          }
                        : null,
                    child: const Text(
                      "Tiếp tục",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                    style: ButtonStyle(
                      backgroundColor: (phoneForgetPassController.text.isNotEmpty)
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
            ],
          ),
        ),
      ),
    );
  }
}
