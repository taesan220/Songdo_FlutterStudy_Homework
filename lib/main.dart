import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_songdo_homework2/pages/main_pages/rooute.dart';
import 'package:flutter_songdo_homework2/pages/main_pages/rooute_getx.dart';
import 'package:flutter_songdo_homework2/pages/main_pages/state.dart';
import 'package:flutter_songdo_homework2/pages/main_pages/state_getx.dart';
import 'package:flutter_songdo_homework2/pages/main_pages/youtubeRooute.dart';
import 'package:flutter_songdo_homework2/pages/push_pages/route/detail_page_02.dart';
import 'package:flutter_songdo_homework2/pages/push_pages/route_getx/detail_page_04.dart';
import 'package:flutter_songdo_homework2/pages/vm.dart';
import 'package:flutter_songdo_homework2/util/logger.dart';
import 'package:flutter_songdo_homework2/util/tmdb/ready.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:styled_widget/styled_widget.dart';

import 'Constant.dart';
import 'api_communication/base_api_communicator.dart';
import 'buttom_navigationbar/custom_bottom_navigationbar.dart';

//Material 이 시작되고 난 후 초기화시 사용
readyForAppStart(BuildContext context) async {
  //시작할때 돌려야 되는 함수 에: 파이어베이스, 초반에 값 초기화 시 사용

  Get.put(HomeViewModel());

  await readtForTMDB();

  await readyForLogger();
}

void main() {
  runApp(GetMaterialApp(
    title: 'MyApp',
    home: const MyApp(),
    routes: {
      'detailpage02': (context) => const DetailPage02(),
    },
    initialBinding: BindingsBuilder(() {
      Get.put(BaseAPICommunication());
    }),
    getPages: [
      GetPage(
        name: '/detailpage04/:val',
        page: () => const DetailPage04(),
      )
    ],
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _selectedIndex = 0;

  final List _widgetOptions = [
    const YoutubeRouteWithNavigator(),
    const NetflixPage(),
    const RouteWithGetx(),
    StateWithSetState(),
    StateWithGetx(),
  ];

  @override
  Widget build(BuildContext context) {
    readyForAppStart(context);

    pageChange(int pageIndex) {
      //
      setState(() {
        _widgetOptions.elementAt(pageIndex);
      });
    }

    //하단 탭바 생성
    CustomBottomNavigationBar bottomBar =
        CustomBottomNavigationBar((bottomBarIndex) => {
              print('변경된 탭 = $bottomBarIndex'),

              _selectedIndex = bottomBarIndex,
              pageChange(_selectedIndex), //페이지 변경
            });

    return Scaffold(
      appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.lightBlue[900],
          leading: Padding(
            padding:
                EdgeInsets.only(left: 10.0), //앱바 (네비게이션 바) 우측에 붙인 버튼의 우측에 공백 추가
            child: Container()
                .backgroundImage(DecorationImage(
                    image: CachedNetworkImageProvider(netflixIconUrl),
                    fit: BoxFit.contain))
                .width(150)
                .height(100)
                .opacity(0.9),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  right: 20.0), //앱바 (네비게이션 바) 우측에 붙인 버튼의 우측에 공백 추가
              child: GestureDetector(
                onTap: () {
                  // _deleteCategory(context); //카테고리 삭제
                },
                child: Row(
                  children: [
                    const Icon(FontAwesomeIcons.chromecast)
                        .iconSize(22)
                        .opacity(0.7),
                    SizedBox(width: 18),
                    const Icon(FontAwesomeIcons.bell).iconSize(22).opacity(0.7),
                    SizedBox(width: 18),
                    const Icon(FontAwesomeIcons.search)
                        .iconSize(22)
                        .opacity(0.7),
                    SizedBox(width: 18),
                    Center(
                      child: Container(
                        width: 25.0,
                        height: 25.0,
                        child: Center(child: Text('T').fontSize(20)),
                        decoration: new BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
      bottomNavigationBar: bottomBar,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
