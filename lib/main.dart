import 'package:flutter/material.dart';
import 'package:microf/pages/splash.dart';
import 'package:fluro/fluro.dart';
import 'package:microf/route/router.dart';
import 'package:microf/route/application.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      /// 生成路由
      onGenerateRoute: Application.router.generator,
    );
  }
}
