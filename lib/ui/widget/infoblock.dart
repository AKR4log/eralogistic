import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget infoBlockCustom({String icon, String title, String description}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: Colors.white),
    child: Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Flexible(
        //     child: SvgPicture.asset(
        //   icon,
        //   height: 40,
        //   width: 185.8,
        //   color: const Color.fromRGBO(57, 94, 149, 1),
        //   fit: BoxFit.fitWidth,
        // )),
        Flexible(
            child: Container(
          height: 40,
          width: 40,
          child: Image.asset(
            icon,
            width: 40,
            height: 40,
            color: const Color.fromRGBO(57, 94, 149, 1),
          ),
          margin: const EdgeInsets.only(right: 8),
        )),
        Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromRGBO(45, 67, 80, 1)),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Color.fromRGBO(96, 111, 137, 1)),
                )
              ],
            ))
      ],
    ),
  );
}
