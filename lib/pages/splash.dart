import 'package:flutter/material.dart';
import 'package:microf/util/assets.dart';
import 'dart:async';
import 'package:microf/route/navigator.dart';
import 'package:microf/util/screenUtil.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _t = 5;
  Timer _timer;

  void goApp() {
    cancel();
    Navigators.goApp(context);
  }

  void init() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print(_t);
      setState(() {
        _t--;
      });
      if (_t == 0) {
        goApp();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  void cancel() {
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  void dispose() {
    super.dispose();
    cancel();
  }

  @override
  Widget build(BuildContext context) {
    Screen.init(context);
    print(Screen.screenWidthDp);
    print(Screen.screenHeightDp);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Assets.getAssetImage("launch/launch6.png"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: OutlineButton(
                onPressed: goApp,
                child: Text("$_t" + "秒"),
                textColor: Colors.black,
                // color: Colors.red,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
              top: 15,
              right: 20,
            ),
          ],
        ),
      ),
    );
  }
}
