import 'package:social_network_application/entities/mini_dto/entity_mini.dart';
import 'package:social_network_application/entities/mini_dto/episode_mini.dart';
import 'package:social_network_application/entities/mini_dto/season_mini.dart';
import 'package:social_network_application/entities/mini_dto/user_mini.dart';

class PostUpdateMini {
  late String? id;
  late String? release;
  late String? body;
  late int category;
  late UserMini? user;
  late EntityMini? entity;
  late SeasonMini? season;
  late EpisodeMini? episode;
  late int likeQuantity = 0;
  late int commentQuantity = 0;
  late String level;
  late int evaluation;
  late bool spoiler;
  late String typePost;

  PostUpdateMini.fromMap({required Map map}) {
    id = map["id"];
    release = map["release"];
    body = map["body"];
    category = map["category"];
    user = UserMini.fromMap(map: map["user"]);
    entity =
        map["entity"] != null ? EntityMini.fromMap(map: map["entity"]) : null;
    season =
        map["season"] != null ? SeasonMini.fromMap(map: map["season"]) : null;
    episode = map["episode"] != null
        ? EpisodeMini.fromMap(map: map["episode"])
        : null;
    likeQuantity = map["likeQuantity"];
    commentQuantity = map["commentQuantity"];
    level = map["level"];
    evaluation = map["evaluation"] ?? 0;
    spoiler = map["spoiler"] ?? false;
    typePost = map["typePost"];
  }
}
