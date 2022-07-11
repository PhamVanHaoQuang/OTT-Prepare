import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ott_prepare/src/presentations/change_password/change_password_screen.dart';

class VerifyByEmail extends StatelessWidget {
  const VerifyByEmail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            top: size.width * .12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 32 / 896),
              SvgPicture.asset("assets/icons/svgs/ic_by_email.svg"),
              SizedBox(height: size.height * 20 / 896),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  children: [
                    const TextSpan(
                      text: "Mã xác minh đã được gửi đến địa chỉ email ",
                    ),
                    TextSpan(
                      text: "thuylinh.nguyen@mcvgo.com",
                      style: const TextStyle(
                        color: Color(0xFF1EC5F9),
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(text: ". Vui lòng kiểm tra lại nhé"),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 20 / 896),
              SizedBox(
                width: size.width * 215 / 414,
                height: size.height * 40 / 896,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Tiếp tục",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff1EC5F9)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
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
