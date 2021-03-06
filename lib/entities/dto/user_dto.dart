class UserDTO {
  late String? idUser;

  late String? name;
  late String? description;
  late String? imageProfile;
  late String? release;
  late String? place;

  late String? email;
  late String? password;

  late bool? checked;
  late bool? privacy;
  late bool? status;

  late String? invitation;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map["idUser"] = idUser;
    map["name"] = name;
    map["email"] = email;
    map["password"] = password;
    map["imageProfile"] = imageProfile;
    map["release"] = release;
    map["description"] = description;
    map["place"] = place;
    map["privacy"] = privacy;
    map["status"] = status;
    map["invitation"] = invitation;
    return map;
  }

  UserDTO({
    required this.idUser,
    required this.name,
    required this.email,
    required this.password,
    required this.imageProfile,
    required this.release,
    required this.description,
    required this.place,
    required this.privacy,
    required this.status,
    required this.invitation,
  });
}
