import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomBottomNavigationBar();
  }
}

class _CustomBottomNavigationBar extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

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
