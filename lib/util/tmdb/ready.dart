import 'package:tmdb_api/tmdb_api.dart';

late TMDB tmdb;
    readtForTMDB() async {
  tmdb = TMDB(
    ApiKeys('276580a8fc1897f1127272fe5619cc8d','apiReadAccessTokenv4'),
  );
}
