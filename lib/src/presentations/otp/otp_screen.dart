import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ott_prepare/src/success_screen/success_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

StreamController<ErrorAnimationType>? errorController;

class _OTPScreenState extends State<OTPScreen> {
  late TextEditingController pinController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pinController = TextEditingController();
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
          title: Text(
            "Xác nhận OTP",
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
        padding: const EdgeInsets.only(left: 16, right: 16, top: 54),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Mã xác nhận đã được gửi đén số điện thoại",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const Text(
                "+84 123 123 456",
                style: TextStyle(
                    color: Color(0xff1EC5F9),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  left: size.width * .1,
                  right: size.width * .1,
                  top: 16,
                ),
                child: PinCodeTextField(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  backgroundColor: Colors.black,
                  appContext: context,
                  hintCharacter: "-",
                  length: 6,
                  cursorHeight: 16,
                  cursorColor: Colors.white,
                  animationType: AnimationType.fade,
                  controller: pinController,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      // currentText = value;
                    });
                  },
                  pinTheme: PinTheme(
                    fieldWidth: size.width * .1,
                    shape: PinCodeFieldShape.circle,
                    activeFillColor: Colors.black,
                    activeColor: Colors.white,
                    selectedColor: Colors.white,
                    disabledColor: Colors.white,
                    inactiveColor: Colors.white,
                    selectedFillColor: Colors.black,
                    inactiveFillColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text("Thời gian nhập mã còn 35s", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.5)),),
              const SizedBox(height: 24),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    children: [
                      const TextSpan(text: "Không nhận được mã xác nhận? "),
                      TextSpan(
                        text: "Gủi lại",
                        style: const TextStyle(
                            color: Color(0xFF1EC5F9),
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = () async {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 75),
              Center(
                child: SizedBox(
                  width: 215,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SuccessScreen(title: "Đăng ký hoàn tất",buttonTitle: "Bắt đầu",subTitle: "Chào mừng bạn đến với MCVGo",)),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
