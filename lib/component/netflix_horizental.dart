import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_songdo_homework2/setting/start.dart';
import 'package:flutter_songdo_homework2/util/tmdb/ready.dart';
import 'package:styled_widget/styled_widget.dart';

class NetFliHorizontalList extends StatelessWidget {
  NetFliHorizontalList(
      {Key? key,
        required this.posterUrls,
        required this.height,
        required this.width,
        required this.listLabel})
      : super(key: key);

  List<String> posterUrls;
  double width;
  double height;
  String listLabel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text(listLabel)
            .textStyle(Theme.of(context).textTheme.headline6!)
            .fontWeight(FontWeight.w600)
            .alignment(Alignment.centerLeft)
            .padding(bottom: 4),
        Container(
          width: double.infinity, //리스트뷰 가로 사이즈 꽉 체움(?)
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal, //가로 리스트뷰 적용
              itemCount: posterUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            tmdb.images.getUrl(posterUrls[index])!),
                        fit: BoxFit.cover),
                  ),
                );
              }),
        )
      ],
    );
  }
}

main() async {
  return await startApp(SafeArea(
      child: Scaffold(
        body: NetFliHorizontalList(
          posterUrls: [
            '/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png',
            '/tEiIH5QesdheJmDAqQwvtN60727.png',
            '/hD8yEGUBlHOcfHYbujp71vD8gZp.png'
          ],
          height: 120,
          width: 180,
          listLabel: '넷플릭스 인기 콘텐츠',
        ),
      )));
}