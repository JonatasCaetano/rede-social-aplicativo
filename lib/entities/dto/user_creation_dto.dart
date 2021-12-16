class UserCreationDTO {
  late String name;
  late String email;
  late String invitationValue;
  late String password;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map["name"] = name;
    map["email"] = email;
    map["invitationValue"] = invitationValue;
    map["password"] = password;
    return map;
  }

  UserCreationDTO.fromMap({required Map map}) {
    name = map["name"];
    email = map["email"];
    invitationValue = map["invitationValue"];
    password = map["password"];
  }
}
