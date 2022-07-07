import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ott_prepare/src/success_screen/success_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isShowPassword = false;
  bool _isShowConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
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
          left: size.width * .08,
          right: size.width * .08,
          top: size.width * .12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Mật khẩu mới",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 1,
              controller: newPasswordController,
              obscureText: _isShowPassword,
              cursorColor: Colors.white,
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
                hintText: "Ít nhất 8 kí tự",
                hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.5)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                suffixIcon: IconButton(
                  icon: (_isShowPassword)
                      ? Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white.withOpacity(0.5),
                        )
                      : Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.white.withOpacity(0.5),
                        ),
                  onPressed: () => setState(() {
                    _isShowPassword = !_isShowPassword;
                  }),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Mật lại khẩu mới",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 1,
              controller: confirmPasswordController,
              obscureText: _isShowConfirmPassword,
              cursorColor: Colors.white,
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
                hintText: "Ít nhất 8 kí tự",
                hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.5)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                suffixIcon: IconButton(
                  icon: (_isShowConfirmPassword)
                      ? Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.white.withOpacity(0.5),
                  )
                      : Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  onPressed: () => setState(() {
                    _isShowConfirmPassword = !_isShowConfirmPassword;
                  },),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 40,
                width: 215,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessScreen(title: "Đổi mật khẩu thành công",buttonTitle:  "OK",),));
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
