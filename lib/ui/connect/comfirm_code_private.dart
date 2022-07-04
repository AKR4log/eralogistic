import 'package:eralogistic/ui/widget/appbar_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:pin_view/pin_view.dart';
import 'package:eralogistic/app/state/feed_state.dart';
import 'package:provider/provider.dart';

class ComfirmCodePrivate extends StatefulWidget {
  final String verificationID;
  const ComfirmCodePrivate({Key key, this.verificationID}) : super(key: key);

  @override
  State<ComfirmCodePrivate> createState() => _ComfirmCodePrivateState();
}

class _ComfirmCodePrivateState extends State<ComfirmCodePrivate> {
  TextEditingController pincode = TextEditingController();

  @override
  void initState() {
    pincode = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  const Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 37),
                    child: Text(
                        'На ваш номер был выслан СМС с 6-ти значным кодом подтверждения',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    // child: PinView(
                    //     count: 6,
                    //     autoFocusFirstField: true,
                    //     margin: const EdgeInsets.all(2),
                    //     obscureText: false,
                    //     style: const TextStyle(
                    //         fontSize: 24.0, fontWeight: FontWeight.w600),
                    //     submit: (String pin) {
                    //       setState(() {
                    //         pincode = pin;
                    //       });
                    //       phoneConfirm(pin, widget.verificationID, context);
                    //     }),
                    child: TextField(
                        controller: pincode,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color.fromRGBO(171, 171, 171, 1)))),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 232,
                          height: 40,
                          margin: const EdgeInsets.only(bottom: 12, top: 50),
                          child: TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(57, 94, 149, 1)),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                            ),
                            child: const Text(
                              'Подтвердить',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              phoneConfirm(pincode.text.trim(),
                                  widget.verificationID, context);
                            },
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Выслать код повторно',
                                style: TextStyle(color: Colors.black)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pincode?.dispose();
    super.dispose();
  }

  phoneConfirm(smsCODE, verID, context) {
    var state = Provider.of<FeedServiceState>(context, listen: false);
    AuthCredential authCredential =
        PhoneAuthProvider.credential(verificationId: verID, smsCode: smsCODE);
    state.signInWithCredentialPrivate(authCredential, context);
  }
}
