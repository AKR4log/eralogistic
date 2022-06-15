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
          child: Column(
        children: [
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
            children: [
              Flexible(
                flex: 2,
                child: inputTextCustom(
                    titleInput: 'БИН',
                    controller: controllerMail,
                    titleHint: '12345678901112',
                    icon: Icomoon.credit_card),
              ),
              Flexible(
                flex: 2,
                child: inputTextCustom(
                    titleInput: 'С какого года работаете?',
                    controller: controllerMail,
                    titleHint: '1995',
                    icon: Icomoon.calendar),
              )
            ],
          ),
          inputMaxLinesTextCustom(
              titleInput: '',
              controller: controllerAddress,
              maxLines: 3,
              titleHint: '',
              icon: Icomoon.map_pin),
          inputMaxLinesTextCustom(
              titleInput: '',
              controller: controllerDetails,
              maxLines: 12,
              titleHint: '',
              icon: Icomoon.map_pin),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Зарегистрироваться',
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
                  onPressed: () {})),
        ],
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
