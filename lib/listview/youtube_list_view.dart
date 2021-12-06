import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_songdo_homework2/listview/youbue_video_list_element.dart';
import 'package:flutter_songdo_homework2/model/exam_youtube_model.dart';

class YoutubeListView extends StatelessWidget {
  final List<YoutubeInfoItem> _list;
  final _scrollController = ScrollController();

  YoutubeListView(this._list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8.0),
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == (_list.length - 1)) {
              Timer(
                Duration(milliseconds: 10),
                () => _scrollController
                    .jumpTo(_scrollController.position.maxScrollExtent),
              );
            }

            return YoubeVideoList(_list[index]);
          }),
    );
  }
}
