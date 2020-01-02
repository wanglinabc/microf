import 'package:flutter/material.dart';
import 'package:microf/pages/splash.dart';
import 'package:fluro/fluro.dart';
import 'package:microf/route/router.dart';
import 'package:microf/route/application.dart';
import 'package:microf/util/sharedPrd.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  SpUtil.init(); //初始化K-V存储
  runApp(MyApp());
}

final GlobalKey navigatorKey = new GlobalKey(); //

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),

      /// 生成路由
      onGenerateRoute: Application.router.generator,
    );
  }
}
