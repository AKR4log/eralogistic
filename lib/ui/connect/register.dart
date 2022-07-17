import 'package:eralogistic/app/state/feed_state.dart';
import 'package:eralogistic/ui/widget/appbar_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  bool errorConfirmPassword = false, load = false, errorStatus = false;

  @override
  void initState() {
    controllerPassword = TextEditingController();
    controllerPhone = TextEditingController();
    controllerConfirmPassword = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<FeedServiceState>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          appBarBack(context),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 93, left: 26, right: 35),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Регистрация',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black)),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 52, bottom: 26),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            child: const Text(
                              'Сотовый номер',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color.fromRGBO(234, 234, 234, 1)),
                            child: TextField(
                                controller: controllerPhone,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  MaskedInputFormatter('+# (###) ### ####')
                                ],
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    hintText: 'Введите свой номер',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color:
                                            Color.fromRGBO(171, 171, 171, 1)))),
                          )
                        ]),
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
                                borderRadius: BorderRadius.circular(3),
                                color: const Color.fromRGBO(234, 234, 234, 1)),
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
                                        color:
                                            Color.fromRGBO(171, 171, 171, 1)))),
                          ),
                        ]),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 49),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 14),
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
                                borderRadius: BorderRadius.circular(3),
                                color: const Color.fromRGBO(234, 234, 234, 1)),
                            child: TextField(
                                controller: controllerConfirmPassword,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                obscuringCharacter: "*",
                                decoration: const InputDecoration(
                                    hintText: 'Подтвердите пароль',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color:
                                            Color.fromRGBO(171, 171, 171, 1)))),
                          ),
                          errorStatus
                              ? Text(
                                  'Данный телефон зарегистрирован.',
                                  style: TextStyle(color: Colors.red[400]),
                                )
                              : const SizedBox(),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  margin: const EdgeInsets.only(
                                      bottom: 12, top: 50),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromRGBO(
                                                  57, 94, 149, 1)),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.zero),
                                    ),
                                    child: load
                                        ? const SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: CircularProgressIndicator(),
                                          )
                                        : const Text(
                                            'Далее',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17,
                                                color: Colors.white),
                                          ),
                                    onPressed: () {
                                      if (controllerPassword.text.trim() ==
                                          controllerConfirmPassword.text
                                              .trim()) {
                                        setState(() {
                                          errorStatus = false;
                                          load = true;
                                        });
                                        state
                                            .register(
                                                context,
                                                controllerPhone.text.trim(),
                                                controllerPassword.text.trim())
                                            .whenComplete(() {
                                          setState(() {
                                            errorStatus = true;
                                            load = false;
                                          });
                                        });
                                      } else {
                                        setState(() {
                                          errorStatus = false;
                                          errorConfirmPassword = true;
                                        });
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height: 40,
                                    width: double.infinity,
                                    child: TextButton(
                                        child: const Text(
                                          'Зарегистрироваться как компания',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        onPressed: () => Navigator.pushNamed(
                                            context, "/RegisterTransport"))),
                                SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: TextButton(
                                        child: const Text(
                                          'Зарегистрироваться как частный перевозчик',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        onPressed: () => Navigator.pushNamed(
                                            context, "/RegisterPrivate"))),
                              ],
                            ),
                          ),
                        ]),
                  )
                ]),
          )
        ],
      )),
    );
  }

  @override
  void dispose() {
    controllerPassword?.dispose();
    controllerPhone?.dispose();
    controllerConfirmPassword?.dispose();
    super.dispose();
  }
}
