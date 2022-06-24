import 'package:eralogistic/services/post/register_user.dart';
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
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPasswordConfirm = TextEditingController();
  bool isLoad = false;

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
    controllerPassword = TextEditingController();
    controllerPasswordConfirm = TextEditingController();
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
                      controller: controllerBIN,
                      titleHint: '12345678901112',
                      icon: Icomoon.credit_card),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 3,
                  child: inputTextCustom(
                      titleInput: 'С какого года работаете?',
                      controller: controllerWorking,
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
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 26),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      child: const Text(
                        'Пароль',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromRGBO(156, 163, 175, 1))),
                      child: TextField(
                          controller: controllerPassword,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: const InputDecoration(
                              hintText: 'Придумайте пароль',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color.fromRGBO(171, 171, 171, 1)))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 14, top: 18),
                      child: const Text(
                        'Подтвердите пароль',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromRGBO(156, 163, 175, 1))),
                      child: TextField(
                          controller: controllerPasswordConfirm,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: const InputDecoration(
                              hintText: 'Подтвердите пароль',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color.fromRGBO(171, 171, 171, 1)))),
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
                    child: isLoad
                        ? const SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(),
                          )
                        : const Text(
                            'Зарегистрироваться',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                    onPressed: () {
                      if (controllerPassword.text.trim() ==
                          controllerPasswordConfirm.text.trim()) {
                        setState(() {
                          isLoad = true;
                        });
                        verifyPhoneCompany(context,
                            phoneNumber: controllerPhone.text.trim(),
                            name: controllerCompanyName.text.trim(),
                            password: controllerPassword.text.trim(),
                            bin: controllerBIN.text.trim(),
                            contact: controllerContactPerson.text.trim(),
                            tenge: controllerTengeAccount.text.trim(),
                            usd: controllerUSDAccount.text.trim(),
                            years: controllerWorking.text.trim(),
                            detail: controllerDetails.text.trim());
                      }
                    })),
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
    controllerPassword?.dispose();
    controllerPasswordConfirm?.dispose();
    super.dispose();
  }
}
