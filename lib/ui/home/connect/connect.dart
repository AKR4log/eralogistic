import 'package:eralogistic/ui/icons.dart';
import 'package:eralogistic/ui/widget/input.dart';
import 'package:flutter/material.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({Key key}) : super(key: key);

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  TextEditingController controllerPhone = TextEditingController();

  @override
  void initState() {
    controllerPhone = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputPhoneCustom(
                  titleInput: 'Номер телефона',
                  controller: controllerPhone,
                  titleHint: '+8 (9548) 123-45-67',
                  icon: Icomoon.phone_forwarded),
              Container(
                  width: double.infinity,
                  height: 40,
                  margin: const EdgeInsets.only(top: 12),
                  child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                            'Войти',
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
                      // onPressed: () => auth_user(
                      //     '7' +
                      //         controllerPhone.text
                      //             .trim()
                      //             .replaceAll(RegExp(r'[^0-9]'), ''),
                      //     context),
                      onPressed: () {})),
            ]),
      )),
    );
  }

  @override
  void dispose() {
    controllerPhone?.dispose();
    super.dispose();
  }
}
