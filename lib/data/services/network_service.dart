import 'dart:convert';

import 'package:http/http.dart';

import '../models/breed.dart';

class NetworkService {
  void fetchDogs() async {
    var url = Uri.parse('https://dog.ceo/api/breeds/list/all');
    var response = await get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    var messageMap = Map<String, dynamic>.from(responseMap['message']);

    var dogMainBreeds = messageMap.keys.toList();
    var myDogsList = <Breed>[];
    for (var d in dogMainBreeds) {
      List putSubBreeds = messageMap[d];
      if (putSubBreeds.isNotEmpty) {
        for (var s in putSubBreeds) {
          final breed = Breed(d, subBreed: s);
          myDogsList.add(breed);
          print('$breed \n');
        }
      } else {
        final breed = Breed(d);
        myDogsList.add(breed);
        print('$breed \n');
      }
    }
  }
}
