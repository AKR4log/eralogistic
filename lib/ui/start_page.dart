import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/big-logo.png',
              height: 102,
              fit: BoxFit.fitHeight,
            ),
            Container(
                width: 232,
                height: 40,
                margin: const EdgeInsets.only(bottom: 12, top: 50),
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
                      'Войти',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, "/LoginPage"))),
            SizedBox(
                width: 232,
                height: 40,
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
                      'Регистрация',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, "/RegisterPage"))),
          ],
        ),
      )),
    );
  }
}
