import 'package:eralogistic/services/get/orders.dart';
import 'package:eralogistic/services/storage.dart';
import 'package:eralogistic/ui/icons.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                // child: ListView(
                //   children: [
                //     container('assets/img/icon/truck.png'),
                //     container('assets/img/icon/truck.png')
                //   ],
                // ),
                child: FutureBuilder(
                    future: getOrdersUser(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const Text("Загрузка ваших заявок");
                      }
                      return ListView(
                          children: snapshot.data.map<Widget>((map) {
                        return container(
                          icon: map['get_waypoint']['type_id'] != 1
                              ? 'assets/img/icon/railway_carriage.png'
                              : 'assets/img/icon/truck.png',
                          number: map['get_waypoint']['car_number'],
                          departure_date: map['get_waypoint']['departure_date'],
                          travel_time: map['get_waypoint']['travel_time'],
                          arrival_date: map['get_waypoint']['arrival_date'],
                          weight: map['get_waypoint']['weight'],
                          volume: map['get_waypoint']['size'],
                          packages: map['get_waypoint']['packages_qty'],
                        );
                      }).toList());
                    }),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 58),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            )),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(57, 94, 149, 1)),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          child: const Icon(Icomoon.arrow_left,
                              color: Colors.white),
                          onPressed: () =>
                              Navigator.pushNamed(context, "/HomePage"),
                        ),
                      ),
                    ]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin:
                    const EdgeInsets.symmetric(vertical: 35, horizontal: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(243, 244, 246, 1),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FutureBuilder(
                          future: getPhone(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const Text("Loading");
                            }
                            return Text(snapshot.data);
                          }),
                      IconButton(
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();

                            await prefs.remove('id').whenComplete(() => prefs
                                .remove('phone')
                                .whenComplete(() => prefs
                                    .remove('password')
                                    .whenComplete(() => Navigator.pushNamed(
                                        context, "/StartPage"))));
                          },
                          icon: Icon(Icons.arrow_forward_rounded))
                    ]),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget container(
      {String icon,
      String number,
      String departure_date,
      String travel_time,
      String arrival_date,
      String weight,
      String volume,
      String packages}) {
    return Container(
      margin: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(243, 244, 246, 1),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 28, top: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    icon,
                    width: 40,
                    height: 40,
                    color: const Color.fromRGBO(57, 94, 149, 1),
                  ),
                ),
                const Text(
                  'Транспорт в пути',
                  style: TextStyle(
                    color: Color.fromRGBO(57, 94, 149, 1),
                  ),
                ),
                Text(
                  'Номер: $number',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(31, 41, 55, 1),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 34),
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Машина в пути',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Дата отправления:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      ),
                      Text(
                        departure_date,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Время в пути:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      ),
                      Text(
                        travel_time,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Дата прибытия:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      ),
                      Text(
                        arrival_date,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 34),
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Машина в пути',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Отправление:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      ),
                      const Text(
                        'Караганда',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Прибытие:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      ),
                      const Text(
                        'Усть-Каменогорск',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Расстояние:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      ),
                      const Text(
                        '758 км',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Пройдено:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      ),
                      const Text(
                        '158 км',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 34, bottom: 70),
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Данные по грузу',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Вес:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      ),
                      Text(
                        '$weight кг',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Объем:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      ),
                      Text(
                        '$volume м.куб',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Кол-во упаковок:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      ),
                      Text(
                        '$packages шт.',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(55, 65, 81, 1)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
