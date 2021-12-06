import 'package:flutter_songdo_homework2/util/tmdb/ready.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'model/PopularMovie.dart';
import 'model/movie.dart';
import 'model/weeklyPopularMovie.dart';

class MyTMDBApi {
  static MyTMDBApi get to => MyTMDBApi();

  String language = 'ko';
  String region = "KR";

  Future<List<Movie>> getMovieTopRated() async {
    var koreaTopRateMovies =
        await tmdb.v3.movies.getTopRated(language: language, region: region)
            as Map<String, dynamic>;
    return PopularMovie.fromJson(koreaTopRateMovies).results;
  }

  Future<List<Movie>> getWeekTrending() async {
    var thisWeekTrend = await tmdb.v3.trending.getTrending(
        mediaType: MediaType.movie,
        timeWindow: TimeWindow.week) as Map<String, dynamic>;
    return WeeklyPopularMovie.fromJson(thisWeekTrend).results;
  }

  Future<List<Movie>> getPouplar() async {
    var topRateMovies = await tmdb.v3.movies
        .getPouplar(language: language, region: region) as Map<String, dynamic>;
    return PopularMovie.fromJson(topRateMovies).results;
  }

  Future<Map> queryMovies({String keyword = "매트릭스"}) async {
    return await tmdb.v3.search
        .queryMovies(keyword, language: language, region: region);
  }

  String imageUrl() {
    return tmdb.images.getUrl("/tva2OlLELCagFynFibcefhn2D9i.jpg") ?? "";
  }
}
