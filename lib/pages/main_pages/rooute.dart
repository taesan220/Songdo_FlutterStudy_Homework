import 'package:flutter/material.dart';
import 'package:flutter_songdo_homework2/pages/push_pages/route/detail_page_01.dart';

class RouteWithNavigator extends StatelessWidget {
  const RouteWithNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('RouteWithNavigator'),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage01(str: '플러터앱'),
              ),
            );
          },
          child: Container(
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
