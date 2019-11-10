import 'package:flutter/cupertino.dart';
import 'package:microf/route/application.dart';
import 'package:microf/route/router.dart';

class Navigators {
 
 static void goApp(BuildContext context){
   Application.router.navigateTo(context, Routes.app,replace: true);
 }

}