import 'package:eralogistic/ui/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget appBarCustom(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    // leading: SvgPicture.asset(
    //   'assets/img/logo.svg',
    //   height: 40,
    //   width: 185.8,
    //   fit: BoxFit.fitWidth,
    // ),
    automaticallyImplyLeading: false,
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(57, 94, 149, 1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 12, horizontal: 10)),
          ),
          onPressed: () => Navigator.pushNamed(context, "/ConnectPage"),
          child: const Icon(Icomoon.user, size: 14, color: Colors.white),
        ),
      )
    ],
  );
}
