import 'package:dio/dio.dart';

class HttpUtils {
  static HttpUtils? _newInstance;
  late Dio dio;
  late BaseOptions options;

  HttpUtils() {
    options = BaseOptions(
        baseUrl: "https://www.wanandroid.com/",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 5),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Credentials": "true",
          'Access-Control-Allow-Headers': 'Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN, Access-Control-Allow-Origin',
          'Access-Control-Expose-Headers': 'Authorization, authenticated',
          'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, OPTIONS',
        });
    dio = Dio(options);
  }

  factory HttpUtils.newInstance(){
    return _newInstance??= HttpUtils();
  }

  static HttpUtils getInstance() {
    _newInstance ??= HttpUtils();
    return _newInstance!;
  }

  get(String url, {data, options}) async {
    Response? response;
    try {
      response = await dio.get(url, queryParameters: data, options: options);
    } on DioException catch (e) {
      print("$url接口请求异常 --- $e");
      formatError(e);
    }
    return response;
  }

  post(String url, {data, options}) async {
    Response? response;
    try {
      response = await dio.post(url, queryParameters: data, options: options);
    } on DioException catch (e) {
      print("$url接口请求异常 --- $e");
      formatError(e);
    }
    return response;
  }

  void formatError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioExceptionType.sendTimeout) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioExceptionType.receiveTimeout) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioExceptionType.badResponse) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioExceptionType.cancel) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }
}
