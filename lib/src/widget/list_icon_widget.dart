import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListIconWidget extends StatelessWidget {
  const ListIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/icons/svgs/ic_logo_google.svg',
            height: size.width * 6 / 100,
            width: size.width * 7 / 100,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/icons/svgs/ic_logo_facebook.svg',
            height: size.width * 6 / 100,
            width: size.width * 7 / 100,
          ),
        ),
      ],
    );
  }
}
