import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ott_prepare/src/presentations/sign_in/login_screen.dart';

class CompleteSignIn extends StatelessWidget {
  const CompleteSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/svgs/ic_complete_sign_in.svg",
            width: size.width * .72,
          ),
          const SizedBox(height: 24),
          const Text(
            "Đăng ký hoàn tất",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            "Chào mừng đến với MCVGo",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.5)),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 215,
            height: 40,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()),
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
                  const Color(0xff1EC5F9),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
