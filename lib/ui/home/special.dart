import 'package:flutter/material.dart';

class SpecialPage extends StatefulWidget {
  const SpecialPage({Key key}) : super(key: key);

  @override
  State<SpecialPage> createState() => _SpecialPageState();
}

class _SpecialPageState extends State<SpecialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Спасибо, что зарегистрировались!\nДля использования функций перевозчика перейдите на веб версию https://epohalogistic.kz',
              textAlign: TextAlign.center,
            )
          ]),
    );
  }
}
