


import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:rickandmorthy/model/model.dart';

class CharacterProvider extends ChangeNotifier {

  String _baseUrl = 'rickandmortyapi.com';

  List<Character> onDisplayCharacter = [];

  int characterPage = 1;

  CharacterProvider(){
    print('CharacterProvider inicializado');
    
    this.getOnDisplayCharacter();
  }

  Future<String> _getJsonData(String endpoint, [int page =19]) async{
    print(page);
    var url =Uri.https(_baseUrl, endpoint, {
        'page': '$page'
      });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayCharacter() async {

    characterPage++;

    final jsonData = await this._getJsonData('/api/character/', characterPage);

    final characterResponse =CharaterPageResponse.fromJson(jsonData);

    onDisplayCharacter = [...onDisplayCharacter, ...characterResponse.results];

    notifyListeners();
  }
}