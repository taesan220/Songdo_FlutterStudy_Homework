import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_songdo_homework2/pages/vm.dart';
import 'package:flutter_songdo_homework2/util/logger.dart';
import 'package:flutter_songdo_homework2/util/tmdb/ready.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

startApp(Widget home) async {
  await readyForRunAppStart();

  return runApp(ScreenUtilInit(
      designSize: const Size(360, 960), builder: () => MyApp(home)));
}

class MyApp extends StatelessWidget {
  final Widget home;
  MyApp(this.home, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "move practice app",
      theme: FlexThemeData.light(scheme: FlexScheme.indigo),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.indigo),
      themeMode: ThemeMode.dark, //Lig ht, Dark, System
      debugShowCheckedModeBanner: false,

      onInit: () async {
        // 초기화 메소드

        return await readyForAppStart(context);
      },
      home: home,
    );
  }
}

//Material 이 시작되기 전에 초기화시 사용
readyForRunAppStart() {
  //시작할때 돌려야 되는 함수 에: 파이어베이스, 초반에 값 초기화 시 사용
}

//Material 이 시작되고 난 후 초기화시 사용
readyForAppStart(BuildContext context) async {
  //시작할때 돌려야 되는 함수 에: 파이어베이스, 초반에 값 초기화 시 사용

  Get.put(HomeViewModel());

  await readtForTMDB();

  await readyForLogger();
}
