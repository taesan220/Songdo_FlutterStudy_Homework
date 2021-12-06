import 'dart:convert';

//유투브 리스트 정보
class YoutubeInfoModel {
  String kind;
  String etag;
  String nextPageToken;
  String regionCode;

  List<YoutubeInfoItem>? items;


  YoutubeInfoModel({
    required this.kind,
    required this.etag,
    required this.nextPageToken,
    required this.regionCode,
    required this.items
  });

  //Json 바인딩
  YoutubeInfoModel.fromJson(Map json)
      :
        kind = json['kind'],
        etag = json['etag'],
        nextPageToken = json['nextPageToken'],
        regionCode = json['regionCode']
  {
    var tmp = json['items'];
    items =
        tmp?.map<YoutubeInfoItem>((e) => YoutubeInfoItem.fromJson(e)).toList();
    print('====================================');
    print(items);
    print('====================================');
  }
}

//유투브 비디오 아이템 정보
class YoutubeInfoItem {
  String kind;
  String etag;
  videoIdInfoItem? idItems;
  YoutubeVideoInfoItem? snippetItems;

  YoutubeInfoItem({
    required this.kind,
    required this.etag,
  });

  //Json 바인딩
  YoutubeInfoItem.fromJson(Map json)
      : kind = json['kind'],
        etag = json['etag']
  {
    //JsonObject Parsing
    Map<String, dynamic> jsonObjectIdInfo = Map<String, dynamic>.from(json['id']);
    idItems = videoIdInfoItem.fromJson(jsonObjectIdInfo);

    Map<String, dynamic> jsonObjectVideoSnippet = Map<String, dynamic>.from(json['snippet']);
    snippetItems = YoutubeVideoInfoItem.fromJson(jsonObjectVideoSnippet);
  }
}

//비디오 정보
class YoutubeVideoInfoItem {
String publichedAt;
String channelld;
String title;
String description;
String channelTitle;
String liveBroadcastContent;
String publishTime;

thumbnailImageInfoModel? thumbnails;


  YoutubeVideoInfoItem({
    required this.publichedAt,
    required this.channelld,
    required this.title,
    required this.description,
    required this.channelTitle,
    required this.liveBroadcastContent,
    required this.publishTime,
  });

//Json 바인딩
  YoutubeVideoInfoItem.fromJson(Map json)
    : publichedAt = json['publishedAt'],
      channelld = json['channelId'],
      title = json['title'],
      description = json['description'],
      channelTitle = json['channelTitle'],
      liveBroadcastContent = json['liveBroadcastContent'],
      publishTime = json['publishTime']
  {
      Map<String, dynamic> jsonObjectVideoThumnails = Map<String, dynamic>.from(json['thumbnails']);
      thumbnails = thumbnailImageInfoModel.fromJson(jsonObjectVideoThumnails);
  }
}

//비디오 아이디 정보
class videoIdInfoItem {
  String kind;
  String videoId;

  videoIdInfoItem({
    required this.kind,
    required this.videoId
  });
  //Json 바인딩
  factory videoIdInfoItem.fromJson(Map<String, dynamic> json) {
    return videoIdInfoItem(
      kind: json['kind'],
      videoId: json['videoId']
    );
  }
}

//Thumbnail 정보 이미지 정보
class thumbnailImageInfoModel {
  thumbnailImageInfoItem base;
  thumbnailImageInfoItem medium;
  thumbnailImageInfoItem height;

thumbnailImageInfoModel({
  required this.base,
  required this.medium,
  required this.height,
});

  //Json 바인딩
  factory thumbnailImageInfoModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> jsonObjectDefaultImageInfo = Map<String, dynamic>.from(json['default']);
    Map<String, dynamic> jsonObjectMediumImageInfo = Map<String, dynamic>.from(json['medium']);
    Map<String, dynamic> jsonObjectHeightImageInfo = Map<String, dynamic>.from(json['high']);

    return thumbnailImageInfoModel(
        base: thumbnailImageInfoItem.fromJson(jsonObjectDefaultImageInfo),
        medium: thumbnailImageInfoItem.fromJson(jsonObjectMediumImageInfo),
        height: thumbnailImageInfoItem.fromJson(jsonObjectHeightImageInfo)
    );
  }
}

//비디오 thumbnail 이미지 세부 정보
class thumbnailImageInfoItem {
  String url;
  int width;
  int height;

  thumbnailImageInfoItem({
    required this.url,
    required this.width,
    required this.height,
  });
  //Json 바인딩
  factory thumbnailImageInfoItem.fromJson(Map<String, dynamic> json) {
    return thumbnailImageInfoItem(
        url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }
}

