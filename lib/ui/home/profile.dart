import 'package:eralogistic/app/service.dart';
import 'package:eralogistic/app/state/feed_state.dart';
import 'package:eralogistic/ui/icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.only(top: 120, bottom: 100),
                child: FutureBuilder(
                    future: state.getOrdersUser(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const Text("Загрузка ваших заявок");
                      }
                      if (snapshot.data.length != 0) {
                        return ListView(
                            children: snapshot.data.map<Widget>((map) {
                          var citys = [
                            {"id": 1, "name": "Алматы"},
                            {"id": 2, "name": "Нур-Султан"},
                            {"id": 3, "name": "Шымкент"},
                            {"id": 4, "name": "Актобе"},
                            {"id": 5, "name": "Караганда"},
                            {"id": 6, "name": "Атырау"},
                            {"id": 7, "name": "Тараз"},
                            {"id": 8, "name": "Павлодар"},
                            {"id": 9, "name": "Семей"},
                            {"id": 10, "name": "Усть-Каменогорск"},
                            {"id": 11, "name": "Кызылорда"},
                            {"id": 12, "name": "Уральск"},
                            {"id": 13, "name": "Костанай"},
                            {"id": 14, "name": "Петропавловск"},
                            {"id": 15, "name": "Актау"},
                            {"id": 16, "name": "Темиртау"},
                            {"id": 17, "name": "Туркестан"},
                            {"id": 18, "name": "Талдыкорган"},
                            {"id": 19, "name": "Кокшетау"},
                            {"id": 20, "name": "Жанаозен"},
                            {"id": 21, "name": "Экибастуз"},
                            {"id": 22, "name": "Рудный"},
                            {"id": 23, "name": "Shanghai-Шанхай"},
                            {"id": 24, "name": "Guangzhou-Гуанчжоу"},
                            {"id": 25, "name": "Yiwu- Иу (Цзиньхуа)"},
                            {"id": 26, "name": "Xi'an -Сиань"},
                            {"id": 27, "name": "Tianjin-Тяньцзинь"},
                            {"id": 28, "name": "Shenzhen-Шэньчжэнь"},
                            {"id": 29, "name": "Ningbo- Нинбо"},
                            {
                              "id": 30,
                              "name":
                                  "Урумчи –  Wūlǔmùqí – административный центр Синьцзян-Уйгурского автономного района"
                            }
                          ];

                          var statusL = [
                            {"id": 1, "name": "Загружается"},
                            {"id": 2, "name": "В пути"},
                            {"id": 3, "name": "Завершенно"},
                            {"id": 4, "name": "Отменен"}
                          ];

                          var start = citys.where((oldValue) =>
                              map['get_waypoint']['departure_city_id']
                                  .toString() ==
                              (oldValue['id'].toString()));
                          var end = citys.where((oldValue) =>
                              map['get_waypoint']['arrival_city_id']
                                  .toString() ==
                              (oldValue['id'].toString()));

                          var status = statusL.where((oldValue) =>
                              map['get_waypoint']['car_status_id'].toString() ==
                              (oldValue['id'].toString()));

                          return container(
                              icon: map['get_waypoint']['type_id'] != 1
                                  ? 'assets/img/icon/railway_carriage.png'
                                  : 'assets/img/icon/truck.png',
                              number: map['get_waypoint']['car_number'] ?? '',
                              departure_date:
                                  map['get_waypoint']['departure_date'] ?? '0',
                              travel_time:
                                  map['get_waypoint']['travel_time'] ?? '0',
                              arrival_date:
                                  map['get_waypoint']['arrival_date'] ?? '0',
                              weight: map['get_waypoint']['weight'] ?? '0 кг',
                              volume: map['get_waypoint']['size'] ?? '0 м.куб',
                              packages: map['get_waypoint']['packages_qty'] ??
                                  '0 шт.',
                              start: start.first,
                              end: end.first,
                              status_id: status.first);
                        }).toList());
                      }
                      return const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Упс, у вас нет активных заявок',
                          textAlign: TextAlign.center,
                        ),
                      );
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
                          icon: const Icon(Icons.arrow_forward_rounded))
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
      String packages,
      dynamic status_id,
      dynamic start,
      dynamic end,
      String distance,
      String passed}) {
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
                Text(
                  'Транспорт - №$number',
                  style: const TextStyle(
                    color: Color.fromRGBO(57, 94, 149, 1),
                  ),
                ),
                Text(
                  'Статус: ${status_id['name']}',
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
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        style: const TextStyle(
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
                        style: const TextStyle(
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
                        style: const TextStyle(
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
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      Text(
                        start['name'],
                        style: const TextStyle(
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
                      Text(
                        end['name'],
                        style: const TextStyle(
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
                      Text(
                        distance ?? '0',
                        style: const TextStyle(
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
                      Text(
                        passed ?? '0',
                        style: const TextStyle(
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
            margin: const EdgeInsets.only(bottom: 35),
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        weight,
                        style: const TextStyle(
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
                        volume,
                        style: const TextStyle(
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
                        packages,
                        style: const TextStyle(
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
