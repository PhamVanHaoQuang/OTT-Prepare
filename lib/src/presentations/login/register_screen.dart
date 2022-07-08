import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widget/button_widget.dart';
import '../../widget/list_icon_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const String errorTextPhone = '';
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
            Navigator.of(context);
          },
        ),
      ),
      backgroundColor: const Color(0x003d3d3d),
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 12.3 / 100,
          right: size.width * 12.3 / 100,
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 6 / 100, bottom: size.height * 15 / 100),
            child: SvgPicture.asset(
              'assets/icons/svgs/logo_mcv_go.svg',
              height: size.height * 5 / 100,
              width: size.width * 29 / 100,
            ),
          ),
          Row(
            children: const [
              Text(
                'Số điện thoại',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            width: size.width,
            // padding: const EdgeInsets.only(
            //   left: 16,
            //   right: 16,
            // ),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: const Color(0xff4B4B4B)),
            child: TextField(
              style: const TextStyle(fontSize: 15, color: Colors.white),
              autofocus: true,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                filled: true,
                fillColor: const Color(0xff4B4B4B),
                isDense: true,
                hintText: 'Nhập số điện thoại',
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                // helperText: '',
                // errorText: 'Số điện thoại không hợp lệ',
                // errorStyle: const TextStyle(color: Color(0xffFF2820)),
                contentPadding: EdgeInsets.only(
                  top: size.height * 1.34 / 100,
                  bottom: size.height * 1.34 / 100,
                  right: size.width * 3.86 / 100,
                  left: size.width * 3.86 / 100,
                ),
              ),
            ),
          ),
          (errorTextPhone != '')
              ? Row(
                  children: const [
                    SizedBox(
                      width: 16,
                    ),
                    Text('Số điện thoại không hợp lệ',
                        style: TextStyle(
                            color: Color(0xffFF2820),
                            fontWeight: FontWeight.w400,
                            fontSize: 12)),
                  ],
                )
              : const SizedBox(
                  height: 14,
                ),
          SizedBox(
            height: size.height * 3 / 100,
          ),
          ButtonWidget(
            text: 'Đăng ký',
            width: size.width,
            colorText: Colors.white,
            colorButton: const Color(0xff8C8C8C),
            onTap: () {},
          ),
          const Spacer(),
          const Text(
            'Đăng ký bằng',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          const ListIconWidget(),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bạn đã có tài khoản?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: const Text(
                  ' Đăng nhập ',
                  style: TextStyle(
                      color: Color(0xff1EC5F9),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'ngay',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Bằng việc Tạo tài khoản, bạn đã đồng ý với các ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                      text: 'Điều khoản sử dụng ',
                      style: const TextStyle(
                          color: Color(0xff1EC5F9),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed('/teams-of-use');
                        }),
                  const TextSpan(
                    text: 'của MCVGo',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )),
          SizedBox(
            height: size.height * 9 / 100,
          )
        ]),
      ),
    );
  }
}
