import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final String? errorText;
  final TextInputType textInputType;
  final TextEditingController? textEditingController;
  TextFieldWidget({
    Key? key,
    required this.text,
    required this.hintText,
    required this.textInputType,
    this.errorText,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: size.width * 4 / 100,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 1.34 / 100,
        ),
        TextField(
          // margin: EdgeInsets.only(bottom: size.height * .8 / 100),
          style: const TextStyle(fontSize: 15, color: Colors.white),
          controller: textEditingController,
          autofocus: true,
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffFF2820), width: 1.0),
                borderRadius: BorderRadius.circular(32.0)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xff1ec5f9), width: 1.0),
                borderRadius: BorderRadius.circular(32.0)),
            filled: true,
            fillColor: const Color(0xff4B4B4B),
            isDense: true,
            hintText: hintText,
            hintMaxLines: 2,
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 15,
                fontWeight: FontWeight.w400),
            //helperText: '',
            //errorText: 'Số điện thoại không hợp lệ',
            errorStyle: const TextStyle(color: Color(0xffFF2820)),
            contentPadding: EdgeInsets.only(
                top: size.height * 1.34 / 100,
                bottom: size.height * 1.34 / 100,
                left: size.width * 3.86 / 100,
                right: size.width * 3.86 / 100),
          ),
        ),
        SizedBox(
          height: size.height * 1.3 / 100,
        ),
      ],
    );
  }
}
