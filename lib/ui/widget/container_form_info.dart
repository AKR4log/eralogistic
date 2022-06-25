// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget container_form_info(
    {String icon,
    String percent,
    double percentD,
    String weight,
    String volume,
    Function fun}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              )),
              Flexible(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Заполненность машины',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Color.fromRGBO(31, 41, 55, 1))),
                              Text(percent + '%',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: Color.fromRGBO(31, 41, 55, 1)))
                            ]),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          child: LinearPercentIndicator(
                            width: 200,
                            animation: true,
                            animationDuration: 200,
                            lineHeight: 8.0,
                            padding: EdgeInsets.zero,
                            percent: percentD,
                            backgroundColor:
                                const Color.fromRGBO(229, 231, 235, 1),
                            progressColor: const Color.fromRGBO(57, 94, 149, 1),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: const Text('Доступно для загрузки',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Color.fromRGBO(31, 41, 55, 1)))),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('По весу:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color.fromRGBO(55, 65, 81, 1))),
                                Text(
                                  weight + ' КГ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color.fromRGBO(55, 65, 81, 1)),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('По объему:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color.fromRGBO(55, 65, 81, 1))),
                                Text(
                                  volume + ' м.куб',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.black),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ])
      ],
    ),
  );
}
