import 'package:eralogistic/app/enum/auth_s.dart';
import 'package:eralogistic/app/state/feed_state.dart';
import 'package:eralogistic/ui/home/home_page.dart';
import 'package:eralogistic/ui/start_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      timer();
    });
    super.initState();
  }

  void timer() async {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      var state = Provider.of<FeedServiceState>(context, listen: false);
      state.getCurrentUser(context);
    });
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Image.asset(
          'assets/img/big-logo.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<FeedServiceState>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: state.authStatus == AuthStatus.NOT_DETERMINED
            ? _body()
            : state.authStatus == AuthStatus.NOT_LOGGED_IN
                ? const StartPage()
                : const HomePage());
  }
}
