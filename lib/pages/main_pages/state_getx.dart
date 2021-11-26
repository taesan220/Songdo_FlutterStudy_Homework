import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_songdo_homework2/api_communication/base_api_communicator.dart';
import 'package:flutter_songdo_homework2/common/custom_dialog.dart';
import '../../model/exam_model.dart';
import 'package:get/get.dart';

class StateWithGetx extends StatelessWidget {
  StateWithGetx({Key? key}) : super(key: key) {
    print('!!!!! StateWithGetx');
  }

  final TextEditingController _textController = TextEditingController();
  final BaseAPICommunicator baseAPICommunicator = Get.find();

  search() {
    String inputText;
    if ((inputText = _textController.text) == '') return;

    baseAPICommunicator.search(inputText);

    _textController.text = '';
    //myController.list.value(inputText);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            child: Obx(() {
              return CustomListView(baseAPICommunicator.list.value);
            }),
            flex: 5,
          ),
          Flexible(
              child: Container(
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 4),
                        child: TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                            hintText: '검색할 단어를 입력하세요.',
                            hintStyle: TextStyle(color: Colors.grey[300]),
                            enabledBorder: InputBorder.none,
                          ),
                          textInputAction: TextInputAction.go,
                          onSubmitted: (_) {
                            search();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          ///겂색 TextField 값이 비어 있는지 확인
                          if (!isSearchTexfieldEmpty(context)) {
                            ///TextField 값이 비어 있지 않으면 검색 수행
                            search();
                          }
                        },
                        child: const Text('검색'),
                      ),
                    )
                  ],
                ),
              ),
              flex: 1),
        ],
      ),
    );
  }

  ///겂색 TextField 값이 비어 있는지 확인 하는 메소드
  bool isSearchTexfieldEmpty(BuildContext context) {
    if (_textController.text == '') {
      CustomDialog.showOneButtonDialog(
          context, '검색 실패', '검색할 단어가 입력되지 않았습니다.\n\n검색할 단어를 입력해 주세요.', '확인');

      return true;
    }

    return false;
  }
}

class CustomListView extends StatelessWidget {
  final List<MovieInfoItem> _list;
  final _controller = ScrollController();

  static const List<Color> colors = [
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
        controller: _controller,
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == (_list.length - 1))
            Timer(
              Duration(milliseconds: 10),
              () => _controller.jumpTo(_controller.position.maxScrollExtent),
            );

          return Card(
            color: colors[index % colors.length],
            shadowColor: Colors.grey,
            child: Row(children: [
              _list[index].image.isNotEmpty
                  ? CachedNetworkImage(imageUrl: _list[index].image)
                  : Container(),
              Text(
                _list[index].title,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ]),
          );
        });
  }
}
