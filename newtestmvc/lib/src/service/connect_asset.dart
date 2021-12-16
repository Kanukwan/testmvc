import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:newtestmvc/src/models/cats_model.dart';

class ConnectCatsAsset {
  static Future<List<CatsAssets>> convertAsset() async {
    final String response =
        await rootBundle.loadString('assets/json/cats.json');
    List<CatsAssets> lst = parseJson(response);
    if (lst.isNotEmpty) {
      return lst;
    } else {
      return <CatsAssets>[];
    }
  }

  static List<CatsAssets> parseJson(String responseBody) {
    /* change type from json array to string dynamic */
    final parse = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parse
        .map<CatsAssets>((json) => CatsAssets.fromJson(json))
        .toList(); // return list data
  }
}
