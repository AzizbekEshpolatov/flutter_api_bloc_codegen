import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'core/api/product_api.dart';
import 'core/hive/api_hive.dart';
import 'core/hive/hive_base.dart';
import 'core/hive/user_hive.dart';
import 'core/utils/colors.dart';
final di = GetIt.instance;
final mainKey = GlobalKey<NavigatorState>();

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupInit();
  await _setupFactory();
}

Future<void> _setupInit() async {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 2)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..maskType = EasyLoadingMaskType.custom
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 50.0
    ..backgroundColor = Colors.transparent
    ..boxShadow = []
    ..displayDuration = const Duration(milliseconds: 600)
    ..animationDuration = const Duration(milliseconds: 600)
    ..userInteractions = false
    ..dismissOnTap = false;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: AppColors.black,
    systemNavigationBarColor: AppColors.black,
  ));
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );
}

Future<void> _setupFactory() async {
  di.registerLazySingleton(() => HiveBase());
  await di.get<HiveBase>().init();
  di.registerLazySingleton(() => ApiHive(di.get()));
  di.registerLazySingleton(() => UserHive(di.get()));
  di.registerLazySingleton<Dio>(() => Dio(BaseOptions(
    baseUrl: "https://fakestoreapi.com",
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
  )));

  di.registerLazySingleton<ProductApi>(() => ProductApi(di.get<Dio>()));
}


