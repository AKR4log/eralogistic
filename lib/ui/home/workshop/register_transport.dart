import 'package:eralogistic/ui/icons.dart';
import 'package:eralogistic/ui/widget/input.dart';
import 'package:flutter/material.dart';

class RegisterTransport extends StatefulWidget {
  const RegisterTransport({Key key}) : super(key: key);

  @override
  State<RegisterTransport> createState() => _RegisterTransportState();
}

class _RegisterTransportState extends State<RegisterTransport> {
  TextEditingController controllerCompanyName = TextEditingController();
  TextEditingController controllerContactPerson = TextEditingController();
  TextEditingController controllerMail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerWorking = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerDetails = TextEditingController();
  TextEditingController controllerTengeAccount = TextEditingController();
  TextEditingController controllerUSDAccount = TextEditingController();
  TextEditingController controllerBIN = TextEditingController();

  @override
  void initState() {
    controllerAddress = TextEditingController();
    controllerBIN = TextEditingController();
    controllerCompanyName = TextEditingController();
    controllerContactPerson = TextEditingController();
    controllerDetails = TextEditingController();
    controllerMail = TextEditingController();
    controllerPhone = TextEditingController();
    controllerTengeAccount = TextEditingController();
    controllerUSDAccount = TextEditingController();
    controllerWorking = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const BackButton(color: Colors.black)),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Регистрация транспортной компании',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
            inputTextCustom(
                titleInput: 'Название компании',
                controller: controllerCompanyName,
                titleHint: '«Что-то там лоджистикс»',
                icon: Icomoon.briefcase),
            inputTextCustom(
                titleInput: 'Контактное лицо',
                controller: controllerContactPerson,
                titleHint: 'Сергей Сидорович',
                icon: Icomoon.user),
            inputTextCustom(
                titleInput: 'Ваша почта',
                controller: controllerMail,
                titleHint: 'info.transportlogistics@mail.kz',
                icon: Icomoon.mail),
            inputPhoneCustom(
                titleInput: 'Ваш телефон',
                controller: controllerPhone,
                titleHint: '+8 (1234) 56-78-91',
                icon: Icomoon.phone_forwarded),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: inputTextCustom(
                      titleInput: 'БИН',
                      controller: controllerMail,
                      titleHint: '12345678901112',
                      icon: Icomoon.credit_card),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 3,
                  child: inputTextCustom(
                      titleInput: 'С какого года работаете?',
                      controller: controllerMail,
                      titleHint: '1995',
                      icon: Icomoon.calendar),
                )
              ],
            ),
            inputMaxLinesTextCustom(
                titleInput: 'Ваш адрес',
                controller: controllerAddress,
                maxLines: 3,
                titleHint:
                    '010000, город Нур-Султан, район Байконур, ул. Мусина-Пушкина, д.125, строение 15, офис 225',
                icon: Icomoon.map_pin),
            inputMaxLinesTextCustom(
              titleInput: 'Ваши реквизиты',
              controller: controllerDetails,
              maxLines: 12,
              titleHint:
                  'Товарищество с ограниченной ответственностью «Что-то там лоджистикс», \nдействующее на основании Устава, в лице директора Сергея Ивановича Нурлиева.\nКБЕ 17\nРеквизиты:\nСвидетельство о постановке на регистрационный учёт по НДС Серия 62001 № 0022386 от 10.08.2012 г.\nСвидетельство о государственной перерегистрации юридического лица № 12174-1901-ТОО от 27.12.2012 г.',
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 2,
                  child: inputTextCustom(
                      titleInput: 'Счет в тенгэ',
                      controller: controllerTengeAccount,
                      titleHint: '12345678901112',
                      icon: Icomoon.credit_card),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 2,
                  child: inputTextCustom(
                      titleInput: 'Счет в USD',
                      controller: controllerUSDAccount,
                      titleHint: 'kz123456987US',
                      icon: Icomoon.credit_card),
                )
              ],
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
                    child: const Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    onPressed: () {})),
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    controllerAddress?.dispose();
    controllerBIN?.dispose();
    controllerCompanyName?.dispose();
    controllerContactPerson?.dispose();
    controllerDetails?.dispose();
    controllerMail?.dispose();
    controllerPhone?.dispose();
    controllerTengeAccount?.dispose();
    controllerUSDAccount?.dispose();
    controllerWorking?.dispose();
    super.dispose();
  }
}
