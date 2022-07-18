import 'dart:convert';
import 'package:array_names/data/models/breed.dart';
import 'package:http/http.dart';

class NetworkService {
  Future<Map<String, dynamic>> fetchDogs() async {
    final url = Uri.parse('https://dog.ceo/api/breeds/list/all');
    final response = await get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    final messageMap = Map<String, dynamic>.from(responseMap['message']);
    return messageMap;
  }

  Future<List<String>> fetchImages(Breed breed) async {
    late final Uri url;
    const imagesCount = 10;
    if (breed.subBreed != null) {
      url = Uri.parse(
          'https://dog.ceo/api/breed/${breed.breed}/${breed.subBreed}/images/random/$imagesCount');
    } else {
      url = Uri.parse(
          'https://dog.ceo/api/breed/${breed.breed}/images/random/$imagesCount');
    }
    final response = await get(url);
    Map<String, dynamic> responseMapImages = json.decode(response.body);
    final messageImages = List<String>.from(responseMapImages['message']);
    return messageImages;
  }
}
