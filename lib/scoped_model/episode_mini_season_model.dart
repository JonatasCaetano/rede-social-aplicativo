import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_network_application/entities/mini_dto/entity_save_mini.dart';

class EpisodeMiniSeasonModel extends Model {
  EntitySaveMini? entitySaveMini;
  bool entitySaveMiniIsNull = true;
  bool load = true;
  late String idUser;

  EpisodeMiniSeasonModel({required String episodeId}) {
    //getEntitySaveEpisodeMini(episodeId: episodeId);
  }
  static const String base =
      "https://jonatas-social-network-api.herokuapp.com/";

  Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    idUser = prefs.getString("id")!;
    notifyListeners();
    return prefs.getString("id")!;
  }

  getEntitySaveEpisodeMini({required String episodeId}) async {
    load = true;
    notifyListeners();
    String idUser = await getId();
    var url = Uri.parse(
        base + 'episodes/get/episode/$episodeId/entitysave/user/$idUser');
    var response = await http.get(url, headers: {
      "Accept": "application/json; charset=utf-8",
      "content-type": "application/json; charset=utf-8"
    });
// ignore: avoid_print
    print("getEntitySaveEpisodeMini: " + response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        var item = json.decode(response.body);
        // ignore: avoid_print
        print(item.toString());
        entitySaveMini = EntitySaveMini.fromMap(map: item);
        notifyListeners();
        entitySaveMiniIsNull = false;
        notifyListeners();
        load = false;
        notifyListeners();
        break;
    }
  }
}
