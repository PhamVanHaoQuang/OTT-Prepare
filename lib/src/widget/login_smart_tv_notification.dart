import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'button_widget.dart';

class LoginSmartTvNotification extends StatelessWidget {
  final bool isSuccess;
  const LoginSmartTvNotification({
    Key? key,
    required this.isSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0x003d3d3d),
      body: Padding(
        padding: EdgeInsets.only(
            left: size.width * 13.2 / 100, right: size.width * 13.2 / 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 33.2 / 100,
            ),
            //image svg
            SvgPicture.asset(
              isSuccess
                  ? 'assets/icons/svgs/ic_login_smartTV_success.svg'
                  : 'assets/icons/svgs/ic_login_smartTV_failed.svg',
              height: size.height * 17.5 / 100,
              width: size.width * 59.1 / 100,
            ),
            SizedBox(
              height: size.height * 3.2 / 100,
            ),
            Text(
              isSuccess ? 'Đăng nhập thành công' : 'Đăng nhập không thành công',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: size.height * 1.78 / 100,
            ),
            Text(
              isSuccess
                  ? 'Bạn đã đăng nhập Smart TV thành công'
                  : 'Rất tiếc, bạn không thể đăng nhập vào Smart TV do lỗi',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: size.height * 24 / 896,
            ),
            ButtonWidget(
              width: size.width / 2,
              colorText: Colors.white,
              text: 'OK',
              colorButton: const Color(0xff1EC5F9),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
