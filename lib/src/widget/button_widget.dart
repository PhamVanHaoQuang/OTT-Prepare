import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final Color colorText;
  final Color colorButton;
  final Color? colorBorder;
  final VoidCallback? onTap;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.width,
    required this.colorText,
    required this.colorButton,
    this.colorBorder,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          padding: EdgeInsets.only(
              top: size.height * 1.34 / 100, bottom: size.height * 1.34 / 100),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: (colorBorder != null)
                  ? Border.all(color: colorBorder!)
                  : Border.all(width: 0),
              borderRadius: BorderRadius.circular(20),
              color: colorButton),
          child: Text(
            text,
            style: TextStyle(
              color: colorText,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          )),
    );
  }
}
