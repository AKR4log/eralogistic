import 'package:eralogistic/app/state/feed_state.dart';
import 'package:eralogistic/ui/icons.dart';
import 'package:eralogistic/ui/widget/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var state = Provider.of<FeedServiceState>(context, listen: false);
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
                icon: Icomoon.briefcase),
            inputTextCustom(
                titleInput: 'Контактное лицо',
                controller: controllerContactPerson,
                icon: Icomoon.user),
            inputTextCustom(
                titleInput: 'Ваша почта',
                controller: controllerMail,
                icon: Icomoon.mail),
            inputPhoneCustom(
                titleInput: 'Ваш телефон',
                controller: controllerPhone,
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
                      icon: Icomoon.credit_card),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 3,
                  child: inputTextCustom(
                      titleInput: 'С какого года работаете?',
                      controller: controllerWorking,
                      icon: Icomoon.calendar),
                )
              ],
            ),
            inputMaxLinesTextCustom(
                titleInput: 'Ваш адрес',
                controller: controllerAddress,
                maxLines: 3,
                icon: Icomoon.map_pin),
            inputMaxLinesTextCustom(
              titleInput: 'Ваши реквизиты',
              controller: controllerDetails,
              maxLines: 12,
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 2,
                  child: inputTextCustom(
                      titleInput: 'Счет в тенге',
                      controller: controllerTengeAccount,
                      icon: Icomoon.credit_card),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 2,
                  child: inputTextCustom(
                      titleInput: 'Счет в USD',
                      controller: controllerUSDAccount,
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
                        state.registerCompany(
                            context,
                            controllerPassword.text.trim(),
                            controllerPhone.text.trim(),
                            controllerCompanyName.text.trim(),
                            controllerContactPerson.text.trim(),
                            controllerDetails.text.trim(),
                            controllerTengeAccount.text.trim(),
                            controllerUSDAccount.text.trim());
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
