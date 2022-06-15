import 'package:eralogistic/app/routes/routes.dart';
import 'package:eralogistic/app/state/app_state.dart';
import 'package:eralogistic/app/state/feed_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Inter',
        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.route(),
        onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
        initialRoute: "SplashPage",
      ),
      providers: [
        ChangeNotifierProvider<AppState>(create: (_) => AppState()),
        ChangeNotifierProvider<FeedServiceState>(
            create: (_) => FeedServiceState()),
      ],
    );
  }
}
