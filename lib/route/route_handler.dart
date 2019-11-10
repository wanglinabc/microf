import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:microf/pages/app.dart';

var appHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print(params);
  return App();
});