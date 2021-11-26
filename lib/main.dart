import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'custom_dialog.dart';
import 'mylistview_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyList(),
    );
  }
}

/// 이렇게 하니 다이얼로그가 팝업이 안됨
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => const MyList();
// }

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyState();
}

class _MyState extends State<MyList> {
  int _counter = 0;

  final List<String> entries = [];

  TextEditingController addItemController = TextEditingController();

  final _bottomContainkey = GlobalKey();

  ///사이즈 알아내기 위해 생성

  late ScrollController _scrollController;

  ///스크롤 컨트롤러

  @override
  void initState() {
    _scrollController = ScrollController();

    ///스크롤 컨트롤러 초기화
  }

  // 리스트에 항목 추가
  void add() {
    setState(() {
      if (addItemController.text == "") {
        CustomDialog.showOneButtonDialog(context, '목록 추가 실패',
            '목록에 추가될 문자열이 입력되지 않았습니다.\n\n추가할 문자열을 입력해 주세요.', '확인');

        return;
      }

      entries.add(addItemController.text); //텍스트필드에 입력된 문자 리스트에 추가
      _counter++;

      addItemController.text = "";
      //    _scrollController.jumpTo(_scrollController.position.minScrollExtent); //스크롤 최 상단으로 이동

      _scrollController.jumpTo(_scrollController.position.maxScrollExtent +
          _bottomContainkey.currentContext!.size!.height); //스크롤 최 하단으로 이동

      _getSize(); //사이즈 조사 => 앱 구동과 상관 없음 지워도 됨

      Fluttertoast.showToast(msg: "목록 추가 완료", toastLength: Toast.LENGTH_SHORT);
    });
  }

  ///사이즈 조사 => 앱 구동과 상관 없음 지워도 됨
  void _getSize() {
    final _size = _bottomContainkey.currentContext!.size;
    final _width = _size!.width;
    final _height = _size.height;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("송도 Flutter 스터디 과제 No.1")),
          ),
          body: Column(
            children: [
              Expanded(child: MyListViewWidget(entries, _scrollController)),
              _BottomContinerWidget(),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: add,
          //   child: const Icon(Icons.add),
          // ),
        ),
      );

  Widget _BottomContinerWidget() {
    return Container(
      key: _bottomContainkey,
      padding:
          const EdgeInsets.only(left: 10.0, top: 0.0, right: 0.0, bottom: 10.0),
      alignment: Alignment(0.0, -1.0),
      child: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 0, right: 10.0, bottom: 15.0),
                  child: TextField(
                    controller: addItemController,
                    decoration: new InputDecoration(
                        hintText: '추가할 문자열을 입력하세요.',
                        hintStyle: TextStyle(color: Colors.grey[300])),
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    add(); //항목 추가
                  },
                  child: Text(
                    "추가",
                    style: TextStyle(color: Colors.lightBlue),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
