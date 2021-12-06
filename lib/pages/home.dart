import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_songdo_homework2/component/netflix_horizental.dart';
import 'package:flutter_songdo_homework2/pages/vm.dart';
import 'package:flutter_songdo_homework2/setting/start.dart';
import 'package:flutter_songdo_homework2/util/tmdb/ready.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../Constant.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: GetBuilder<HomeViewModel>(
              builder: (viewModel) => SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container()
                            .backgroundImage(DecorationImage(
                                image: CachedNetworkImageProvider(tmdb.images
                                    .getUrl(
                                        'wv22frLmCpXDRjKj4MWFwa4eTOK.jpg')!),
                                fit: BoxFit.cover))
                            .height(480),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  //투명도를 비율로 조절
                                  Colors.black.withOpacity(1),
                                  Colors.black.withOpacity(0.0),
                                  Colors.black.withOpacity(0.25),
                                  Colors.black.withOpacity(1),
                                ],
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter),
                          ),
                        ).height(480),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container()
                                    .backgroundImage(DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            netflixIconUrl),
                                        fit: BoxFit.contain))
                                    .height(30)
                                    .width(30)
                                    .opacity(0.9),
                                const Icon(FontAwesomeIcons.chromecast)
                                    .iconSize(26)
                                    .opacity(0.7),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('TV프로그램'),
                                Text('영화'),
                                Text('카테고리'),
                              ],
                            ).opacity(0.8)
                          ],
                        ).padding(left: 6, right: 10, vertical: 15),
                        Column(
                          children: [
                            SizedBox(
                              height: 440,
                            ),
                            Text('긴장감 넘치는, 액션스릴러')
                                .textStyle(
                                    Theme.of(context).textTheme.bodyText1!)
                                .alignment(Alignment.center)
                                .opacity(0.9),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.add).iconSize(30),
                                    SizedBox(width: 2),
                                    Text('내가 찜한 콘텐츠')
                                  ],
                                ).expanded(),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.play)
                                          .iconSize(14)
                                          .iconColor(Theme.of(context)
                                              .backgroundColor),
                                      SizedBox(width: 5),
                                      Text('재생')
                                          .textColor(
                                              Theme.of(context).backgroundColor)
                                          .fontWeight(FontWeight.bold)
                                    ],
                                  ).padding(horizontal: 30, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color!,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.info_outline).iconSize(30),
                                    SizedBox(width: 2),
                                    Text('정보')
                                  ],
                                ).expanded()
                              ],
                            ).opacity(0.8)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    NetFliHorizontalList(
                      posterUrls: viewModel.posterUrls1,
                      width: 110,
                      height: 170,
                      listLabel: '넷플릭스 인기 콘텐츠',
                    ),
                    NetFliHorizontalList(
                      posterUrls: viewModel.posterUrls1,
                      width: 110,
                      height: 170,
                      listLabel: '지금 뜨는 컨텐츠',
                    ),
                    NetFliHorizontalList(
                      posterUrls: viewModel.posterUrls1,
                      width: 170,
                      height: 250,
                      listLabel: '오직 넷플릭스에서 ',
                    ),
                  ],
                ).padding(bottom: 20),
              ),
            )));
  }
}

main() async {
  return await startApp(Home());
}
