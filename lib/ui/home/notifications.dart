import 'package:eralogistic/app/notification.dart';
import 'package:eralogistic/app/state/feed_state.dart';
import 'package:eralogistic/ui/icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<FeedServiceState>(context, listen: false);
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
                margin: const EdgeInsets.only(top: 110),
                child: FutureBuilder(
                    future: state.getAllNotification(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: const Center(
                                child: Text("Загрузка уведомлений")));
                      }
                      if (snapshot.data.length != 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  readNotifications();
                                  Navigator.pushReplacementNamed(
                                      context, "/Notifications");
                                },
                                child: const Text('Прочитать все уведомления')),
                            SizedBox(
                              width: 400,
                              height: MediaQuery.of(context).size.height - 200,
                              child: ListView(
                                primary: true,
                                children: snapshot.data.map<Widget>((map) {
                                  return container(
                                      number: map['waypoint']['car_number'],
                                      status: map['text'],
                                      isRead: map['is_old'] != 0 ? true : false,
                                      x: map['updated_at']);
                                }).toList(),
                              ),
                            ),
                          ],
                        );
                      }
                      return const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'У вас нет уведомлений',
                          textAlign: TextAlign.center,
                        ),
                      );
                    }),
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

  Widget container({String number, String status, bool isRead, var x}) {
    DateTime y = DateTime.parse(x);
    final DateFormat formatter = DateFormat('dd.MM.yyyy, HH:mm');
    final String formatted = formatter.format(y);
    return TextButton(
      onPressed: () => showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )),
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) {
          return DraggableScrollableActuator(
              child: DraggableScrollableSheet(
            minChildSize: 0.3,
            initialChildSize: 0.6,
            maxChildSize: 0.9,
            expand: false,
            builder: (context, controller) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 15),
                    child: Text('Сообщение от компании: $status'),
                  )
                ],
              );
            },
          ));
        },
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flex(
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
                                    child: Text(
                                      'Транспорт с номером',
                                      style: TextStyle(color: Colors.black),
                                    )),
                                Row(
                                  children: [
                                    Text(
                                      number,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        ' ' + status,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                )
                              ])),
                          Text(
                            formatted,
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
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
