import 'package:flutter/material.dart';
import 'package:flutter_songdo_homework2/main.dart';

class CustomBottomNavigationBar extends StatefulWidget {
//  final VoidCallback onCountSelected; // Void 콜백메소드
  final Function(int) onCountChange; //값을 리턴하는 콜백메소드

  CustomBottomNavigationBar(this.onCountChange, {Key? key, required}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomBottomNavigationBar();
  }
}

class _CustomBottomNavigationBar extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  _CustomBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: _selectedIndex, //현재 선택된 Index
      onTap: (int index) {
        setState(() {
          //변경된 바 인덱스를 리턴하는 콜백 메소드 호출
          widget.onCountChange(index);

          _selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: '라우트',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: '라우트 getx',
          icon: Icon(Icons.music_note),
        ),
        BottomNavigationBarItem(
          label: 'state',
          icon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          label: 'state getx',
          icon: Icon(Icons.library_books),
        ),
      ],
    );
  }
}
