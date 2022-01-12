import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:social_network_application/converts_enum/convert_to_enum.dart';
import 'package:social_network_application/entities/mini_dto/entity_mini.dart';
import 'package:social_network_application/entities/mini_dto/entity_save_mini.dart';
import 'package:social_network_application/entities/mini_dto/season_mini.dart';
import 'package:social_network_application/entities/mini_dto/worker_mini.dart';
import 'package:social_network_application/scoped_model/auxiliar/language_model.dart';

class EntityModel extends Model {
  static const String base =
      "https://jonatas-social-network-api.herokuapp.com/";

  bool load = false;
  late EntityMini entityMini;
  bool entityMiniIsNull = true;
  List<WorkerMini> workers = [];
  List<SeasonMini> seasons = [];
  late String idUser;
  EntitySaveMini? entitySaveMini;
  int maxLine = 5;
  List<DropdownMenuItem<int>> dropdownList = [];

  Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    idUser = prefs.getString("id")!;
    notifyListeners();
    return prefs.getString("id")!;
  }

  getById({required String entityId}) async {
    load = true;
    notifyListeners();
    var url = Uri.parse(base + 'entities/get/entity/$entityId');
    var response = await http.get(url, headers: {
      "Accept": "application/json; charset=utf-8",
      "content-type": "application/json; charset=utf-8"
    });
    // ignore: avoid_print
    print('getEntityById: ' + response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        var item = json.decode(response.body);
        // ignore: avoid_print
        print(item);
        entityMini = EntityMini.fromMap(map: item);
        loadDropdownList();
        load = false;
        entityMiniIsNull = false;
        notifyListeners();
    }
  }

  getSeason({required String entityId}) async {
    load = true;
    notifyListeners();
    var url = Uri.parse(base + 'entities/get/entity/$entityId/seasons');
    var response = await http.get(url, headers: {
      "Accept": "application/json; charset=utf-8",
      "content-type": "application/json; charset=utf-8"
    });
// ignore: avoid_print
    print("getSeason: " + response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        seasons = [];
        var itens = json.decode(response.body);
        for (var item in itens) {
          SeasonMini seasonMini = SeasonMini.fromMap(map: item as Map);
          seasons.add(seasonMini);
          notifyListeners();
        }
        load = false;
        notifyListeners();
        break;
    }
  }

  getEntitySave() {}
  getWorkers({required String entityId}) async {
    load = true;
    notifyListeners();
    var url = Uri.parse(base + 'entities/get/entity/$entityId/workers');
    var response = await http.get(url, headers: {
      "Accept": "application/json; charset=utf-8",
      "content-type": "application/json; charset=utf-8"
    });
// ignore: avoid_print
    print("getWorkersEntity: " + response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        workers = [];
        var itens = json.decode(response.body);
        for (var item in itens) {
          WorkerMini workerMini = WorkerMini.fromMap(map: item as Map);
          workers.add(workerMini);
          notifyListeners();
        }
        load = false;
        notifyListeners();
        break;
    }
  }

  newWorker() {}
  deleteWorker() {}

  updateMaxLine() {
    if (maxLine == 5) {
      maxLine = 500;
      notifyListeners();
    } else {
      maxLine = 5;
      notifyListeners();
    }
  }

  loadDropdownList() {
    dropdownList.add(DropdownMenuItem(
      child: Text(LanguageModel().entitiesCategories[
          ConvertToEnum.convertTypeEntityToValue(
              typeEntity: entityMini.typeEntity)][1]),
      value: 1,
    ));
    dropdownList.add(DropdownMenuItem(
      child: Text(LanguageModel().entitiesCategories[
          ConvertToEnum.convertTypeEntityToValue(
              typeEntity: entityMini.typeEntity)][2]),
      value: 2,
    ));
    dropdownList.add(DropdownMenuItem(
      child: Text(LanguageModel().entitiesCategories[
          ConvertToEnum.convertTypeEntityToValue(
              typeEntity: entityMini.typeEntity)][3]),
      value: 3,
    ));
    dropdownList.add(DropdownMenuItem(
      child: Text(LanguageModel().entitiesCategories[
          ConvertToEnum.convertTypeEntityToValue(
              typeEntity: entityMini.typeEntity)][4]),
      value: 4,
    ));
    notifyListeners();
  }
}
