import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';

///ListViewWidget
class MyListViewWidget extends StatelessWidget {
  late final List<String> entries;

  final List<MaterialColor> rainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.lightBlue,
    Colors.indigo,
    Colors.purple
  ];

  ScrollController _scrollController;

  MyListViewWidget(this.entries, this._scrollController);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(8.0),
      itemCount: entries.length,
      itemBuilder: (context, index) => Card(
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
                      '${entries[index]}',
                      style: TextStyle(fontSize: 17.0),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
