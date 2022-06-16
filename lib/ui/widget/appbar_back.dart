import 'package:eralogistic/ui/icons.dart';
import 'package:flutter/material.dart';

Widget appBarBack(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 58),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        height: 50,
        width: 50,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(57, 94, 149, 1)),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          child: const Icon(Icomoon.arrow_left, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, "/StartPage"),
        ),
      ),
      Image.asset(
        'assets/img/mini-logo.png',
        height: 50,
        fit: BoxFit.fitHeight,
      ),
    ]),
  );
}
