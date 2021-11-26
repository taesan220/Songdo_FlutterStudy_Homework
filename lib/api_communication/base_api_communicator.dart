import 'dart:convert';
import 'package:get/get.dart';
import '../../model/exam_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';

class BaseAPICommunicator extends GetxController {
  //final isDebugMode = true;

  final RxList<MovieInfoItem> list = <MovieInfoItem>[].obs;

  void search(String inputText) async {
    Map<String, String>? headers = Map();
    headers['X-Naver-Client-Id'] = '클라이언트 아이디';
    headers['X-Naver-Client-Secret'] = '클라이언트 비밀키';

    Uri uri = Uri.parse(
        'https://openapi.naver.com/v1/search/movie.json?query=${inputText}&display=10&start=1&genre=1');
    await get(
      uri,
      headers: headers,
    ).then((response) {
      var aa = utf8.decode(response.bodyBytes);
      var body = jsonDecode(aa);
      var ttt = MovieInfoModel.fromJson(body);
      list.value = ttt.items ?? <MovieInfoItem>[];
    }).catchError((dynamic, StackTrace) {
      print(dynamic.toString());
      Get.snackbar("return", dynamic.toString());
    });
  }
}
