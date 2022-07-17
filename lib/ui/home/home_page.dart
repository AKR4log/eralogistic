// ignore_for_file: missing_required_param

import 'package:eralogistic/app/notification.dart';
import 'package:eralogistic/app/service.dart';
import 'package:eralogistic/app/state/controllers.dart';
import 'package:eralogistic/app/state/feed_state.dart';
import 'package:eralogistic/ui/icons.dart';
import 'package:eralogistic/ui/widget/appbar.dart';
import 'package:eralogistic/ui/widget/container_form_info.dart';
import 'package:eralogistic/ui/widget/infoblock.dart';
import 'package:eralogistic/ui/widget/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  String valTrack, valFrom, valFor, valTrackName, valFromName, valForName;
  var idWaypoint, newMessage;
  bool errValTrack = false,
      errValFrom = false,
      errValFor = false,
      errValName = false,
      errValPhone = false,
      twoStepActivate = false;

  init() async {
    controllerPhone.text = await getPhone();
    controllerName.text = await getName();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<FeedServiceState>(context, listen: false);
    return Scaffold(
      appBar: appBarCustom(context),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: Column(children: [
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Поиск транспорта',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color.fromRGBO(57, 94, 149, 1)),
                      ),
                      Text(
                        'Как работает наш сервис',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color.fromRGBO(31, 41, 55, 1)),
                      ),
                      Text(
                        'Помощь в организации сборных грузов',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(75, 85, 99, 1)),
                      ),
                    ]),
              ),
              infoBlockCustom(
                  icon: 'assets/img/icon/choose_direction.png',
                  title: 'Выберите направление',
                  description:
                      'Зарегистрируйтесь в сервисе. Выберите направление для Вашего груза в форме поиска.Мы каждый день увеличиваем охват транспортных компаний и направлений.'),
              infoBlockCustom(
                  icon: 'assets/img/icon/select_transport.png',
                  title: 'Выберите транспорт',
                  description:
                      'Выберите предпочитаемый транспорт для перевозки Вашего груза.В системе ежедневно регистрируются более 100 машин по разным направлениям.'),
              infoBlockCustom(
                  icon: 'assets/img/icon/contact_us.png',
                  title: 'Обработка заявки',
                  description:
                      'Ваша заявка на транспортировку будет обработана в кратчайшие срокии менеджер свяжется с Вами для уточнения деталей по грузу.'),
              infoBlockCustom(
                  icon: 'assets/img/icon/track.png',
                  title: 'Счастливого пути',
                  description:
                      'После согласования Вам будет предоставлена информация о погрузкеВашего груза и вы будете информированы на каждом этапе, от погрузки до прибытия.'),
            ]),
          ),
          twoStepActivate ? twoStep() : oneStep()
        ],
      )),
    );
  }

  Widget oneStep() {
    var state = Provider.of<FeedServiceState>(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(16, 24, 40, 0.1),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 34),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Поиск транспорта',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color.fromRGBO(57, 94, 149, 1)),
                ),
                Text(
                  'Подберем транспорт для\nвашего груза',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color.fromRGBO(31, 41, 55, 1)),
                ),
                Text(
                  'Помощь в организации сборных грузов',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromRGBO(75, 85, 99, 1)),
                ),
              ]),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Выберите транспорт",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(57, 94, 149, 1)),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icomoon.info,
                        size: 14,
                        color: Color.fromRGBO(229, 231, 235, 1),
                      ))
                ],
              ),
            ),
            valTrack != null && valTrack != ''
                ? Text(
                    'Выбрано: $valTrackName',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: errValFrom
                                ? Border.all(
                                    width: 1,
                                    color: const Color.fromRGBO(220, 38, 38, 1))
                                : Border.all(
                                    width: 1,
                                    color: const Color.fromRGBO(
                                        156, 163, 175, 1))),
                        child: TypeAheadField<dynamic>(
                          hideSuggestionsOnKeyboardHide: true,
                          textFieldConfiguration: const TextFieldConfiguration(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icomoon.map_pin,
                                size: 18,
                                color: Color.fromRGBO(57, 94, 149, 1),
                              ),
                              border: InputBorder.none,
                              hintText: 'Выберите транспорт',
                            ),
                          ),
                          suggestionsCallback: SearchAutocorrect.getTypes,
                          itemBuilder: (context, suggestion) {
                            if (suggestion.toString() == "false") {
                              return const SizedBox();
                            }
                            return ListTile(
                              title: Text(suggestion['name']),
                            );
                          },
                          noItemsFoundBuilder: (context) => const SizedBox(
                            height: 100,
                            child: Center(
                              child: Text(
                                'No Found.',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                          onSuggestionSelected: (dynamic suggestion) {
                            final type = suggestion;

                            setState(() {
                              errValTrack = false;
                              valTrack = type['id'].toString();
                              valTrackName = type['name'].toString();
                            });
                          },
                        ),
                      ),
                      errValTrack
                          ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: const Text(
                                'Ошибка - обязательное поле',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color.fromRGBO(220, 38, 38, 1)),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
          ]),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Откуда",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(57, 94, 149, 1)),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icomoon.info,
                        size: 14,
                        color: Color.fromRGBO(229, 231, 235, 1),
                      ))
                ],
              ),
            ),
            valFrom != null && valFrom != ''
                ? Text(
                    'Выбрано: $valFromName',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: errValFrom
                                ? Border.all(
                                    width: 1,
                                    color: const Color.fromRGBO(220, 38, 38, 1))
                                : Border.all(
                                    width: 1,
                                    color: const Color.fromRGBO(
                                        156, 163, 175, 1))),
                        child: TypeAheadField<dynamic>(
                          hideSuggestionsOnKeyboardHide: true,
                          textFieldConfiguration: const TextFieldConfiguration(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icomoon.map_pin,
                                size: 18,
                                color: Color.fromRGBO(57, 94, 149, 1),
                              ),
                              border: InputBorder.none,
                              hintText: 'Начальная точка маршрута',
                            ),
                          ),
                          suggestionsCallback: SearchAutocorrect.getCity,
                          itemBuilder: (context, suggestion) {
                            if (suggestion.toString() == "false") {
                              return const SizedBox();
                            }
                            return ListTile(
                              title: Text(suggestion['name']),
                            );
                          },
                          noItemsFoundBuilder: (context) => const SizedBox(
                            height: 100,
                            child: Center(
                              child: Text(
                                'No Found.',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                          onSuggestionSelected: (dynamic suggestion) {
                            final type = suggestion;

                            setState(() {
                              errValFrom = false;
                              valFrom = type['id'].toString();
                              valFromName = type['name'].toString();
                            });
                          },
                        ),
                      ),
                      errValFrom
                          ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: const Text(
                                'Ошибка - обязательное поле',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color.fromRGBO(220, 38, 38, 1)),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  )
          ]),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Куда",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(57, 94, 149, 1)),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icomoon.info,
                        size: 14,
                        color: Color.fromRGBO(229, 231, 235, 1),
                      ))
                ],
              ),
            ),
            valFor != null && valFor != ''
                ? Text(
                    'Выбрано: $valForName',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: errValFrom
                                ? Border.all(
                                    width: 1,
                                    color: const Color.fromRGBO(220, 38, 38, 1))
                                : Border.all(
                                    width: 1,
                                    color: const Color.fromRGBO(
                                        156, 163, 175, 1))),
                        child: TypeAheadField<dynamic>(
                          hideSuggestionsOnKeyboardHide: true,
                          textFieldConfiguration: const TextFieldConfiguration(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icomoon.map_pin,
                                size: 18,
                                color: Color.fromRGBO(57, 94, 149, 1),
                              ),
                              border: InputBorder.none,
                              hintText: 'Конец маршрута',
                            ),
                          ),
                          suggestionsCallback: SearchAutocorrect.getCity,
                          itemBuilder: (context, suggestion) {
                            if (suggestion.toString() == "false") {
                              return const SizedBox();
                            }
                            return ListTile(
                              title: Text(suggestion['name']),
                            );
                          },
                          noItemsFoundBuilder: (context) => const SizedBox(
                            height: 100,
                            child: Center(
                              child: Text(
                                'No Found.',
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                          onSuggestionSelected: (dynamic suggestion) {
                            final type = suggestion;

                            setState(() {
                              errValFor = false;
                              valFor = type['id'].toString();
                              valForName = type['name'].toString();
                            });
                          },
                        ),
                      ),
                      errValFor
                          ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: const Text(
                                'Ошибка - обязательное поле',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color.fromRGBO(220, 38, 38, 1)),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
          ]),
        ),
        Container(
            width: 232,
            height: 40,
            margin: const EdgeInsets.only(bottom: 32, top: 24),
            child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(57, 94, 149, 1)),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Найти транспорт',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icomoon.chevrons_right,
                      size: 8,
                      color: Colors.white,
                    )
                  ],
                ),
                onPressed: () {
                  if (valTrack != null) {
                    if (valFrom != null) {
                      if (valFor != null) {
                        setState(() {
                          twoStepActivate = true;
                        });
                      } else {
                        setState(() {
                          errValFor = true;
                        });
                      }
                    } else {
                      setState(() {
                        errValFrom = true;
                      });
                    }
                  } else {
                    setState(() {
                      errValTrack = true;
                    });
                  }
                })),
      ]),
    );
  }

  Widget twoStep() {
    var state = Provider.of<FeedServiceState>(context, listen: false);
    return FutureBuilder(
        future: state.searchAuto(valTrack, valFrom, valFor),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              margin: const EdgeInsets.only(bottom: 30, top: 15),
              width: double.infinity,
              child: const Text(
                'Поиск подходящих машин',
                textAlign: TextAlign.center,
              ),
            );
          }

          if (snapshot.data.length != 0) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(16, 24, 40, 0.1),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Поиск транспорта',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromRGBO(57, 94, 149, 1)),
                              ),
                              Text(
                                'Мы нашли для вас\nтранспорт: ${valTrack == "1" ? "фуры" : "вогоны"}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Color.fromRGBO(31, 41, 55, 1)),
                              )
                            ])),
                    ...snapshot.data.map<Widget>((map) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            container_form_info(
                                icon: map['type_id'] != 1
                                    ? 'assets/img/icon/railway_carriage.png'
                                    : 'assets/img/icon/truck.png',
                                percent: map['number'] != '-'
                                    ? map['number'].toString()
                                    : '0',
                                percentD: map['number_d'].toDouble(),
                                weight: map['available_weight'].toString(),
                                volume: map['available_size'].toString()),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: 105,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromRGBO(57, 94, 149, 1)),
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      idWaypoint = map['id'];
                                    });
                                  },
                                  child: idWaypoint == map['id']
                                      ? const Text(
                                          "Выбран",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      : const Text(
                                          'Выбрать',
                                          style: TextStyle(color: Colors.white),
                                        )),
                            )
                          ]);
                    }).toList(),
                    inputTextCustom(
                        titleInput: 'Как вас зовут',
                        controller: controllerName,
                        icon: Icomoon.user),
                    inputPhoneCustom(
                        titleInput: 'Номер телефона',
                        controller: controllerPhone,
                        icon: Icomoon.phone_forwarded),
                    Container(
                        width: double.infinity,
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 32, top: 24),
                        child: TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(57, 94, 149, 1)),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Подать заявку',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icomoon.chevrons_right,
                                  size: 8,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            onPressed: () {
                              if (idWaypoint != null && idWaypoint != '') {
                                state.createOrder(
                                    idWaypoint.toString(),
                                    controllerName.text.trim(),
                                    controllerPhone.text.trim(),
                                    context);
                              }
                            })),
                  ]),
            );
          }
          return Container(
            margin: const EdgeInsets.only(bottom: 30, top: 15),
            width: double.infinity,
            child: const Text(
              'Упс, ничего не найдено',
              textAlign: TextAlign.center,
            ),
          );
        });
  }

  @override
  void dispose() {
    controllerName?.dispose();
    controllerPhone?.dispose();
    super.dispose();
  }
}
