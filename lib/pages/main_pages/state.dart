import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_songdo_homework2/common/custom_dialog.dart';
import 'package:flutter_songdo_homework2/listview/custom_listview.dart';

class StateWithSetState extends StatefulWidget {
  StateWithSetState({Key? key}) : super(key: key) {
    print('!!!!! StateWithSetState');
  }

  @override
  _StateWithSetStateState createState() => _StateWithSetStateState();
}

class _StateWithSetStateState extends State<StateWithSetState> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _list = [];

  _StateWithSetStateState() {
    print("!!!! _StateWithSetStateState");
  }

  add() {
    String inputText;
    if ((inputText = _textController.text) == '') return;

    setState(() {
      _list.add(inputText);
      _textController.text = '';
    });
  }

  @override
  void initState() {
    print("!!!! initState");
    super.initState();
  }

  @override
  void dispose() {
    print("!!!! dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            child: CustomListView(_list),
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
                            hintText: '추가할 문자를 입력하세요.',
                            hintStyle: TextStyle(color: Colors.grey[300]),
                            enabledBorder: InputBorder.none,
                          ),
                          textInputAction: TextInputAction.go,
                          onSubmitted: (_) {
                            add();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          ///겂색 TextField 값이 비어 있는지 확인
                          if (!isAddTexfieldEmpty(context)) {
                            ///TextField 값이 비어 있지 않으면 검색 수행
                            add();
                          }
                        },
                        child: const Text('추가'),
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
  bool isAddTexfieldEmpty(BuildContext context) {
    if (_textController.text == '') {
      CustomDialog.showOneButtonDialog(
          context, '문자 추가 실패', '추가할 문자가 입력되지 않았습니다.\n\n추가할 문자를 입력해 주세요.', '확인');

      return true;
    }

    return false;
  }
}
