import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:flutter_songdo_homework2/main.dart';
import 'package:flutter_songdo_homework2/pages/home.dart';

class CustomBottomNavigationBar extends StatefulWidget {
//  final VoidCallback onCountSelected; // Void 콜백메소드
  final Function(int) onCountChange; //값을 리턴하는 콜백메소드

  CustomBottomNavigationBar(this.onCountChange, {Key? key, required})
      : super(key: key);

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
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: _selectedIndex,
      //현재 선택된 Index
      onTap: (int index) {
        setState(() {
          //변경된 바 인덱스를 리턴하는 콜백 메소드 호출
          widget.onCountChange(index);

          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/shorts_button.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
            activeIcon: Image.asset(
              'assets/images/shorts_button.png',
              width: 20,
              height: 20,
              color: Colors.black,
            ),
            label: 'shorts'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/plus_button.png',
              width: 30,
              height: 30,
              color: Colors.white,
            ),
            activeIcon: Image.asset(
              'assets/images/plus_button.png',
              width: 30,
              height: 30,
              color: Colors.black,
            ),
            label: ''),
        BottomNavigationBarItem(
          label: 'Subscriptions',
          icon: Icon(MaterialCommunityIcons.youtube_subscription),
        ),
        BottomNavigationBarItem(
          label: 'Library',
          icon: Icon(MaterialCommunityIcons.play_box_multiple_outline),
        ),
      ],
    );
  }
}
