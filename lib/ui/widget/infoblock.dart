import 'package:flutter/material.dart';

Widget infoBlockCustom({IconData icon, String title, String description}) {
  return Container(
    height: 99,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: Colors.white),
    child: Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          child:
              Icon(icon, color: const Color.fromRGBO(57, 94, 149, 1), size: 40),
        ),
        Flexible(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
