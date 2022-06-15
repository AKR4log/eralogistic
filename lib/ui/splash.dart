import 'package:eralogistic/app/enum/auth_s.dart';
import 'package:eralogistic/app/state/feed_state.dart';
import 'package:eralogistic/ui/connect/login.dart';
import 'package:eralogistic/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Center(
        // child: SvgPicture.asset(
        //   'assets/img/logo.svg',
        //   height: 75,
        //   width: 159,
        //   fit: BoxFit.fitHeight,
        // ),
        child: Text(
          'ЭПОХА\nЛОГИСТИК',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 42),
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
                ? const LoginPage()
                : const HomePage());
  }
}
