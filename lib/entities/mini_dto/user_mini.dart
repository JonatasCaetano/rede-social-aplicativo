class UserMini {
  late String id;

  late String name;
  late String? image;
  late String? description;
  late String? place;

  late String? email;

  late bool checked;
  late bool privacy;
  late bool status;

  late int quantityFollowing;
  late int quantityFollowers;
  late String typeObject;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map["id"] = id;
    map["name"] = name;
    map["image"] = image;
    map["description"] = description;
    map["place"] = place;
    map["email"] = email;
    map["checked"] = checked;
    map["privacy"] = privacy;
    map["status"] = status;
    map["quantityFollowing"] = quantityFollowing;
    map["quantityFollowers"] = quantityFollowers;
    map["typeObject"] = typeObject;
    return map;
  }

  UserMini.fromMap({required Map map}) {
    id = map["id"];
    name = map["name"];
    image = map["image"];
    description = map["description"];
    place = map["place"];
    email = map["email"];
    checked = map["checked"];
    privacy = map["privacy"];
    status = map["status"];
    quantityFollowing = map["quantityFollowing"];
    quantityFollowers = map["quantityFollowers"];
    typeObject = map['typeObject'];
  }
}
