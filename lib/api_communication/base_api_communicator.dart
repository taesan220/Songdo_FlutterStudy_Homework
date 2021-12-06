import 'dart:convert';
import 'package:flutter_songdo_homework2/model/exam_youtube_model.dart';
import 'package:get/get.dart';
import '../../model/exam_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class BaseAPICommunication extends GetxController {
  //final isDebugMode = true;

  final RxList<MovieInfoItem> list = <MovieInfoItem>[].obs;


  void search(String inputText) async {
    Map<String, String>? headers = Map();
    headers['X-Naver-Client-Id'] = 'o1g0GLhqYW4MvnTUhJBH';
    headers['X-Naver-Client-Secret'] = 'Ua4TB09KGK';

    Uri uri = Uri.parse(
        'https://openapi.naver.com/v1/search/movie.json?query=${inputText}&display=10&start=1&genre=1');
    await http.get(
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

  Future<List> youtubeSearch() async {
    http.Response result = await http.get(Uri.parse('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&type=video&key=AIzaSyCsNuEMQB4-ph2HFDOggKcVL68Hdm2LMYw'));

    if (result.statusCode == 200) {
      // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
      var aa = utf8.decode(result.bodyBytes);
      var body = jsonDecode(aa);
      var ttt = YoutubeInfoModel.fromJson(body);
      List<dynamic> youtubeInfo = ttt.items ?? <YoutubeInfoItem>[];

      print('list');
      return youtubeInfo;
    } else {
      // 만약 요청이 실패하면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }
}