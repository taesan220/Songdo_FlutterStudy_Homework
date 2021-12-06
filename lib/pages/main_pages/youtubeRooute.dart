import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_songdo_homework2/api_communication/base_api_communicator.dart';
import 'package:flutter_songdo_homework2/listview/youtube_list_view.dart';
import 'package:flutter_songdo_homework2/model/exam_youtube_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'package:styled_widget/styled_widget.dart';

class YoutubeRouteWithNavigator extends StatefulWidget {
  const YoutubeRouteWithNavigator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _YoutubeRouteWithNavigator();
}

class _YoutubeRouteWithNavigator extends State<YoutubeRouteWithNavigator> {
  late Future<List> _list;
  int listCount = 0;

  final BaseAPICommunication baseAPICommunication = Get.find();

  @override
  void initState() {
    _list = baseAPICommunication.youtubeSearch() as Future<List>;
    print(_list);
  }

  @override
  Widget build(BuildContext context) {
//    search();

    return Stack(
      children: [
        Column(children: [
          Container(
            height: 40,
            child: ListView(
              // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
              scrollDirection: Axis.horizontal,
              // 컨테이너들을 ListView의 자식들로 추가
              children: <Widget>[
                Container(
                  width: 120.0,
                  color: Colors.transparent,
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                    color: Colors.grey[300],
                    child: Row(
                      children: [
                        IconTheme(
                          data: new IconThemeData(color: Colors.black),
                          child:
                              const Icon(MaterialCommunityIcons.compass_outline)
                                  .iconSize(22)
                                  .opacity(0.7),
                        ),
                        SizedBox(width: 5),
                        Text('Explore'),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 2.0,
                  color: Colors.grey,
                ),
                Container(
                  width: 115.0,
                  color: Colors.transparent,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 5, right: 3, bottom: 5, left: 10),
                      child: Center(child: Text('New to you').fontSize(15)),
                      decoration: new BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                                25.0) //                 <--- border radius here
                            ),
                      ),
                    ),
                  ),
                ),
                TopContainer('Audiobooks', 100, null),
                TopContainer('History', 75, null),
                TopContainer('Humans', 80, null),
                TopContainer("Game shows", 115, null),
                TopContainer("Mysteries", 115, null),
                TopContainer(
                    "International English Language Testing System", 350, null),
                TopContainer("Universe", 80, null),
                TopContainer("Conversation", 100, null),
                TopContainer("StarCraft", 90, null),
                TopContainer("Sales", 60, null),
                TopContainer("Game shows", 115, null),
                Container(
                    width: 150.0,
                    color: Colors.transparent,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 5, right: 10, bottom: 5, left: 10),
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'SEND FEEDBACK',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          FutureBuilder<List<dynamic>>(
            future: _list,
            builder: (context, snapshot) {
              List<YoutubeInfoItem>? arrayYoutubeInfo =
                  snapshot.data?.cast<YoutubeInfoItem>();
              if (arrayYoutubeInfo == null) {
                listCount = 0;
              } else {
                listCount = arrayYoutubeInfo.length;
              }

              return Container(
                //   height: double.infinity,
                //   width: double.infinity,child:*your_child*)
                // width: 300,
                // height: 500,
                child: ListView.builder(
                  itemCount: listCount,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    if (arrayYoutubeInfo != null) {
                      //        return Text(arrayYoutubeInfo[index].snippetItems!.title);
                      return Container(
                        child: YoutubeListView(
                            arrayYoutubeInfo as List<YoutubeInfoItem>),
                      );
                    }
                    return Text('데이터 없음');
                  },
                ),
              ).expanded();
            },
          ),
        ]),
      ],
    );
  }

  @override
  Widget TopContainer(String title, double width, EdgeInsets? margin) {
    EdgeInsets? edgeInsetsMargin = margin;

    if (edgeInsetsMargin == null) {
      edgeInsetsMargin = EdgeInsets.only(top: 5, right: 3, bottom: 5, left: 3);
    }

    return Container(
      width: width,
      color: Colors.transparent,
      child: Center(
        child: Container(
          margin: edgeInsetsMargin,
          child: Center(child: Text(title).fontSize(15)),
          decoration: new BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(
              width: 1.0,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(25.0) //                 <--- border radius here
                ),
          ),
        ),
      ),
    );
  }
}
