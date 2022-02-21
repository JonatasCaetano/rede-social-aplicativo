class PostTalkDTO {
  late String idPost;
  late String release;
  late String body;
  late String typePostVisibility;
  late bool spoiler;
  late String idAuthor;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map["idPost"] = idPost;
    map["release"] = release;
    map["body"] = body;
    map["typePostVisibility"] = typePostVisibility;
    map["spoiler"] = spoiler;
    map["idAuthor"] = idAuthor;
    return map;
  }

  PostTalkDTO({
    required this.idPost,
    required this.release,
    required this.body,
    required this.typePostVisibility,
    required this.spoiler,
    required this.idAuthor,
  });
}
