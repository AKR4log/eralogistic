import 'package:eralogistic/app/enum/auth_s.dart';
import 'package:eralogistic/app/state/feed_state.dart';
import 'package:eralogistic/ui/widget/appbar_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool load = false;

  @override
  void initState() {
    controllerPassword = TextEditingController();
    controllerPhone = TextEditingController();
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
                          state.authStatus == AuthStatus.PASSWORD_REQUIRED
                              ? Text(
                                  'Пароль обязателен.',
                                  style: TextStyle(color: Colors.red[400]),
                                )
                              : const SizedBox(),
                          state.authStatus == AuthStatus.PHONE_NOT_EXIST
                              ? Text(
                                  'Данный телефон не зарегистрирован.',
                                  style: TextStyle(color: Colors.red[400]),
                                )
                              : const SizedBox(),
                          state.authStatus == AuthStatus.LOGIN_INVALID
                              ? Text(
                                  'Проверьте написание пароля, что-то пошло не так.',
                                  style: TextStyle(color: Colors.red[400]),
                                )
                              : const SizedBox(),
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
                                      child: load
                                          ? const SizedBox(
                                              height: 25,
                                              width: 25,
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : const Text(
                                              'Войти',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17,
                                                  color: Colors.white),
                                            ),
                                      onPressed: () {
                                        setState(() {
                                          load = true;
                                        });
                                        state.auth(
                                            controllerPhone.text.trim(),
                                            controllerPassword.text.trim(),
                                            context);
                                        setState(() {});
                                      }),
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
                          )
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
