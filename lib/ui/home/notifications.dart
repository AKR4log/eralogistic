import 'package:eralogistic/ui/icons.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 100),
                child: ListView(
                  children: [
                    container(
                        number: '001 ААА 17',
                        status: 'в пути',
                        time: '5 минут назад',
                        isRead: false),
                    container(
                        number: '001 ААА 17',
                        status: 'в пути',
                        time: '5 минут назад',
                        isRead: false),
                    container(
                        number: '001 ААА 17',
                        status: 'в пути',
                        time: '5 минут назад',
                        isRead: false)
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.only(top: 120, bottom: 100),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 58),
                child: Row(children: [
                  Container(
                    margin: const EdgeInsets.only(right: 50),
                    height: 50,
                    width: 50,
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(57, 94, 149, 1)),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child:
                          const Icon(Icomoon.arrow_left, color: Colors.white),
                      onPressed: () =>
                          Navigator.pushNamed(context, "/HomePage"),
                    ),
                  ),
                  Text(
                    'Уведомления',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  )
                ]),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget container({String number, String status, String time, bool isRead}) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 4,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Column(children: [
                          const SizedBox(
                              width: double.infinity,
                              child: Text('Транспорт с номером')),
                          Row(
                            children: [
                              Text(
                                number,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(' ' + status),
                            ],
                          )
                        ])),
                    Text(
                      time,
                      style: const TextStyle(
                          color: Color.fromRGBO(171, 171, 171, 1),
                          fontSize: 12),
                    )
                  ])),
          Flexible(
              child: isRead
                  ? const SizedBox()
                  : Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromRGBO(57, 94, 149, 1),
                      )))
        ],
      ),
    );
  }
}
