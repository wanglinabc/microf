import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:microf/config/config.dart';

class Http {
  static Dio handle;
  static Dio getHandle() {
    if (handle == null) {
      BaseOptions option = BaseOptions(
        baseUrl: DEV_MODE ? BASE_URL_DEV : BASE_URL_PRO,
        connectTimeout: 5000,
        receiveTimeout: 20000,
      );
      handle = Dio(option);
      handle.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        // 在请求被发送之前做一些事情
        return options; //continue
        // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      }, onResponse: (Response response) async {
        // 在返回响应数据之前做一些预处理
        if (response.statusCode != 200) {
          return handle.reject(response);
        }
        return response; // continue
      }, onError: (DioError e) async {
        // 当请求失败时做一些预处理
        print(e.type);
        return e; //continue
      }));
      handle.interceptors.add(LogInterceptor(responseBody: DEV_MODE)); //开启请求日志
    }
    return handle;
  }

  static Future httpGet(BuildContext context, String url,
      {Map<String, dynamic> params}) async {
    try {
      Response response;
      Dio dio = getHandle();
      dio.options.extra["ctx"] = context;
      response = await dio.get(url, queryParameters: params);
      return response.data.toString();
    } on DioError catch (e) {
      //一般是网络问题导致的
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request);
    }
  }

  static Future httpPost(
      BuildContext context, String url, Map<String, dynamic> params,
      {bool isJson = false}) async {
    try {
      Response response;
      Dio dio = getHandle();
      dio.options.extra["ctx"] = context;
      response = await dio.post(url, data: params);
      return response.data.toString();
    } on DioError catch (e) {
      //一般是网络问题导致的{
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request);
    }
  }

  static Future httpRequest(BuildContext context, String url,
      {Map<String, dynamic> params,
      String method = "GET",
      bool isJson = false}) async {
    try {
      Response response;
      Dio dio = getHandle();
      dio.options.extra["ctx"] = context;
      response = await dio.request(url,
          data: params,
          options: Options(
              method: method,
              contentType: isJson
                  ? Headers.jsonContentType
                  : Headers.formUrlEncodedContentType));
      return response;
    } on DioError catch (e) {
      //一般是网络问题导致的{
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request);
    }
  }
}
