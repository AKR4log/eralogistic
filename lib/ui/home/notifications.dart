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
                  SizedBox(
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
                  Text('Уведомления')
                ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
