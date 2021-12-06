import 'package:flutter_songdo_homework2/util/tmdb/api.dart';
import 'package:flutter_songdo_homework2/util/tmdb/model/movie.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  static HomeViewModel get to => Get.find();

  List<String> posterUrls1 = [
    '',
    '',
    '',
  ].obs;
  List<String> posterUrls2 = [
    '',
    '',
    '',
  ].obs;
  List<String> posterUrls3 = [
    '',
    '',
    '',
  ].obs;

  @override
  void onInit() {
    //컨트롤러가 켜질때 실행됨 (initState 와 비슷)
    getMoviePosterList();

    print('THE movie data gotten');

    super.onInit();
  }

  getMoviePosterList() async {
    List<Movie> topRateMovie = await MyTMDBApi.to.getMovieTopRated();

    posterUrls1 = [];
    for (var element in topRateMovie) {
      posterUrls1.add(element.posterPath);
    }
    posterUrls2 = [];
    for (var element in topRateMovie) {
      posterUrls2.add(element.posterPath);
    }
    posterUrls3 = [];
    for (var element in topRateMovie) {
      posterUrls3.add(element.posterPath);
    }

    update();
  }
}
