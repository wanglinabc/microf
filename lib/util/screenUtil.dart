import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Screen {
  static ScreenUtil instance;

  static void init(
    BuildContext context, {
    double width: 750,
    double height: 1334,
    bool allowFontScaling: false,
  }) {
    instance = ScreenUtil(
        width: width, height: height, allowFontScaling: allowFontScaling)
      ..init(context);
  }

  static num setH(num h) {
    return instance.setHeight(h);
  }

  static num setW(num w) {
    return instance.setWidth(w);
  }

  static num setF(num w) {
    return instance.setSp(w);
  }

  // 每个逻辑像素的字体像素数，字体的缩放比例
  /// The number of font pixels for each logical pixel.
  static double get textScaleFactor => ScreenUtil.textScaleFactor;

  /// 设备的像素密度
  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double get pixelRatio => ScreenUtil.pixelRatio;

  /// 当前设备宽度 dp
  /// The horizontal extent of this size.
  static double get screenWidthDp => ScreenUtil.screenHeightDp;

  ///当前设备高度 dp
  ///The vertical extent of this size. dp
  static double get screenHeightDp => ScreenUtil.screenHeightDp;

  /// 当前设备宽度 px
  /// The vertical extent of this size. px
  static double get screenWidth => ScreenUtil.screenWidth * pixelRatio;

  /// 当前设备高度 px
  /// The vertical extent of this size. px
  static double get screenHeight => ScreenUtil.screenHeight * pixelRatio;

  /// 状态栏高度 dp 刘海屏会更高
  /// The offset from the top
  static double get statusBarHeight => ScreenUtil.statusBarHeight;

  /// 底部安全区距离 dp
  /// The offset from the bottom.
  static double get bottomBarHeight => ScreenUtil.bottomBarHeight;
}
