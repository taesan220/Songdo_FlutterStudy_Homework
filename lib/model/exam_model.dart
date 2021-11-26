class MovieInfoModel {
  String lastBuildDate;
  int total;
  int start;
  int display;
  List<MovieInfoItem>? items;

  MovieInfoModel({
    required this.lastBuildDate,
    required this.total,
    required this.start,
    required this.display,
  });

  //Json 바인딩
  MovieInfoModel.fromJson(Map json)
      : lastBuildDate = json['lastBuildDate'],
        total = json['total'],
        start = json['start'],
        display = json['display'] {
    var tmp = json['items'];
    items = tmp?.map<MovieInfoItem>((e) => MovieInfoItem.fromJson(e)).toList();
  }
}

class MovieInfoItem {
  String title;
  String link;
  String image;
  String subtitle;
  String pubDate;
  String director;
  String actor;
  String userRating;

  MovieInfoItem({
    required this.title,
    required this.link,
    required this.image,
    required this.subtitle,
    required this.pubDate,
    required this.director,
    required this.actor,
    required this.userRating,
  });

  //Json 바인딩
  MovieInfoItem.fromJson(Map json)
      : title = json['title'],
        link = json['link'],
        image = json['image'],
        subtitle = json['subtitle'],
        pubDate = json['pubDate'],
        director = json['director'],
        actor = json['actor'],
        userRating = json['userRating'];
}
