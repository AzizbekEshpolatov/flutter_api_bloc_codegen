import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../hive/api_hive.dart';

class ApiBase {
  final Dio _dio;
  final ApiHive _hive;
  var _fromCache = false;

  static const baseUrl = "https://oldstreet.uz/api/";

  ApiBase(this._dio, this._hive) {
    init();
  }

  void init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          _fromCache = false;
          debugPrint("From Cache: ${options.extra["from_cache"]}");
          final accessToken = _hive.accessToken;
          if (options.extra["no_token"] != true && accessToken.isNotEmpty) {
            options = options.copyWith(
              headers: {
                ...options.headers,
                "Authorization": "Bearer $accessToken",
              },
            );
          }
          if (options.extra["from_cache"] != true) {
            debugPrint(
              "*** ON_REQUEST(${options.method}) ***\n"
              "URL: ${options.uri}\n"
              "Extra: ${options.extra}\n"
              "Headers: ${options.headers}\n"
              "Data: ${options.data}\n"
              "*********************",
            );
          } else {
            final data = _hive.get(options.path);
            if (data.isNotEmpty) {
              try {
                final json = jsonDecode(data);
                _fromCache = true;
                return handler.resolve(
                  Response(requestOptions: options, data: json),
                );
              } on FormatException catch (_) {}
            }
          }
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          debugPrint(
            "*** ON_RESPONSE(${response.statusCode}) ***\n"
            "URL: ${response.realUri}\n"
            "BODY: ${response.data}\n"
            "FROM CACHE: $_fromCache\n"
            "*********************",
          );
          if (response.requestOptions.extra["from_cache"] != null &&
              (response.statusCode ?? 0) >= 200 &&
              (response.statusCode ?? 0) < 300) {
            try {
              final string = jsonEncode(response.data);
              await _hive.put(response.requestOptions.path, string);
            } on FormatException catch (_) {}
          }
          return handler.next(response);
        },
        onError: (error, handler) async {
          debugPrint(
            "*** ON_ERROR ***\n"
            "URL: ${error.response?.realUri}\n"
            "Message: ${error.message}\n"
            "*********************",
          );
          return handler.next(error);
        },
      ),
    );
  }

  ApiHive get hive => _hive;

  Dio get dio => _dio;

  bool get fromCache => _fromCache;
}
