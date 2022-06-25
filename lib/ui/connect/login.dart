import 'package:eralogistic/services/post/auth.dart';
import 'package:eralogistic/ui/widget/appbar_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  void initState() {
    controllerPassword = TextEditingController();
    controllerPhone = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  const Text('Вход',
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
                    margin: const EdgeInsets.only(bottom: 49),
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
                                    hintText: 'Введите свой пароль',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color:
                                            Color.fromRGBO(171, 171, 171, 1)))),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 232,
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
                                    child: const Text(
                                      'Войти',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: Colors.white),
                                    ),
                                    onPressed: () => auth(
                                        controllerPhone.text.trim(),
                                        controllerPassword.text.trim(),
                                        context),
                                  ),
                                ),
                                SizedBox(
                                    width: 232,
                                    height: 40,
                                    child: TextButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color.fromRGBO(
                                                      57, 94, 149, 1)),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.zero),
                                        ),
                                        child: const Text(
                                          'Восстановить',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                        onPressed: () => Navigator.pushNamed(
                                            context, "/RegisterPage"))),
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
    super.dispose();
  }
}
