import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/login_smart_tv_notification.dart';
import '../../../widget/text_field_widget.dart';

class EditInformationScreen extends StatelessWidget {
  const EditInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0x003d3d3d),
          elevation: 1,
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
            'Chỉnh sửa thông tin cá nhân',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        backgroundColor: const Color(0x003d3d3d),
        body: body(context));
  }

  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: size.width * 3.86 / 100,
          right: size.width * 3.86 / 100,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 2.2 / 100,
                    bottom: size.height * 1.5 / 100),
                child: ClipOval(
                  child: Container(
                    height: size.width * 24 / 100,
                    width: size.width * 24 / 100,
                    child: SvgPicture.asset(
                        'assets/icons/svgs/ic_logo_facebook.svg'),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  ' Sửa hình ảnh',
                  style: TextStyle(
                      color: Color(0xff1EC5F9),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: size.height * 4 / 100,
              ),
              TextFieldWidget(
                text: 'Họ tên',
                hintText: 'Nguyễn Văn A',
                textInputType: TextInputType.name,
              ),
              TextFieldWidget(
                text: 'Email',
                hintText: 'vana@gmail.com',
                textInputType: TextInputType.emailAddress,
              ),
              TextFieldWidget(
                text: 'Số điện thoại',
                hintText: '0909 123 123',
                textInputType: TextInputType.phone,
              ),
              TextFieldWidget(
                text: 'Địa chỉ',
                hintText: 'Số nhà, tên đường, phương, quận/huyện, tỉnh thành',
                textInputType: TextInputType.streetAddress,
              ),
              SizedBox(
                height: size.height * 3 / 100,
              ),
              Row(
                children: [
                  ButtonWidget(
                    text: 'Hủy',
                    width: size.width * 43 / 100,
                    colorText: const Color(0xff1ec5f9),
                    colorButton: const Color(0xff3D3D3D),
                    colorBorder: const Color(0xff1ec5f9),
                  ),
                  SizedBox(
                    width: size.width * 4 / 100,
                  ),
                  ButtonWidget(
                    text: 'Xác nhận',
                    width: size.width * 43 / 100,
                    colorText: Colors.white,
                    colorButton: const Color(0xff1ec5f9),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 4 / 100,
              ),
              Divider(
                height: 1,
                color: Colors.white.withOpacity(0.59),
              ),
              SizedBox(
                height: size.height * 1.3 / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const LoginSmartTvNotification(
                                  isSuccess: false,
                                )),
                      );
                    },
                    child: const Text(
                      ' Đăng nhập SmartTV',
                      style: TextStyle(
                          color: Color(0xff1EC5F9),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 1.3 / 100,
              ),
              Divider(
                height: 1,
                color: Colors.white.withOpacity(0.59),
              ),
              SizedBox(
                height: size.height * 1.4 / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Đăng xuất',
                      style: TextStyle(
                          color: Color(0xff1EC5F9),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
