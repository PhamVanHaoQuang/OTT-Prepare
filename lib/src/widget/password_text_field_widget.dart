import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final String text;
  final String? errorText;
  final TextEditingController? textEditingController;
  bool passwordVisible = true;
  final Function(String) onChanged;

  PasswordTextFieldWidget({
    Key? key,
    required this.text,
    this.errorText,
    this.textEditingController,
    required this.passwordVisible,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
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
              widget.text,
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
          controller: widget.textEditingController,

          autofocus: true,
          keyboardType: TextInputType.visiblePassword,
          obscureText: widget.passwordVisible,
          onChanged: widget.onChanged,
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
            hintText: 'Ít nhất 8 kí tự',
            hintMaxLines: 2,
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 15,
                fontWeight: FontWeight.w400),
            helperText: '',
            errorText: widget.errorText,
            errorStyle: const TextStyle(color: Color(0xffFF2820)),
            suffixIcon: IconButton(
              icon: Icon(
                (widget.passwordVisible == true)
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.white.withOpacity(0.5),
                size: 22,
              ),
              onPressed: () {
                setState(() {
                  widget.passwordVisible = !widget.passwordVisible;
                });
              },
            ),
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
