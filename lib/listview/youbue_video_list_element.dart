import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_songdo_homework2/model/exam_youtube_model.dart';
import 'package:styled_widget/styled_widget.dart';

import '../Constant.dart';

class YoubeVideoList extends StatefulWidget {
  final YoutubeInfoItem _youtubeInfoItem;
  YoubeVideoList(this._youtubeInfoItem);

  @override
  State<StatefulWidget> createState() => _YoubeVideoListState();
}

class _YoubeVideoListState extends State<YoubeVideoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container()
                      .backgroundImage(DecorationImage(
                          image: CachedNetworkImageProvider(youtubeThumNailPictureUrl),
                          fit: BoxFit.contain))
                      .height(30)
                      .width(30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        child: Column(
                      children: [
                        Text(widget._youtubeInfoItem.snippetItems!.title),
                        Text(
                          widget._youtubeInfoItem.snippetItems!.publishTime,
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2.0,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ],
          ),
          Container()
              .backgroundImage(DecorationImage(
                  image: CachedNetworkImageProvider( widget._youtubeInfoItem.snippetItems!.thumbnails!.height.url),
                  fit: BoxFit.contain))
              .height(300)
              .width(300),
        ],
      ),
    );
  }
}
