import 'package:eralogistic/ui/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget appBarCustom() {
  return AppBar(
    leading: SvgPicture.asset(
      'assets/img/logo.svg',
      height: 40,
      width: 185.8,
      fit: BoxFit.fitWidth,
    ),
    actions: [
      TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(57, 94, 149, 1)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 14, horizontal: 10)),
        ),
        onPressed: () {},
        child: const Icon(Icomoon.user, size: 12, color: Colors.white),
      )
    ],
  );
}
