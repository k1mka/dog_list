import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  void fetchDogs() async {
    var url = Uri.parse('https://dog.ceo/api/breeds/list/all');
    var response = await get(url);
    var listDogs = <String>[];
    Map<String, dynamic> responseMap = json.decode(response.body);
    var messageMap = Map<String, dynamic>.from(responseMap['message']);

    var sortedDogKeys = messageMap.keys.toList();

    print(sortedDogKeys);

    //print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }
}
