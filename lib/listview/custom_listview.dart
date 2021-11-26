import 'dart:async';

import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final List<String> _list;
  final _scrollController = ScrollController();

  static const List<Color> rainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  CustomListView(this._list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
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

          return Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3.0),

              ///리스트뷰 항목 라운드 처리
              child: Container(
                height: 50,
                color: rainbowColors[index % rainbowColors.length],
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 0.0, right: 20.0, bottom: 0.0),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          '${_list[index]}',
                          style: TextStyle(fontSize: 17.0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
