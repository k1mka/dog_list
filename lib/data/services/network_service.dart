import 'dart:convert';
import 'package:array_names/data/models/breed.dart';
import 'package:http/http.dart';

class NetworkService {
  static const _baseUrl = "https://dog.ceo";
  static const _apiUrl = "$_baseUrl/api";

  static const _dogListEndpointUrl = '$_apiUrl/breeds/list/all';

  static const _messageKey = 'message';

  String _breedPhotoEndpointUrl(Breed breed) =>
      '$_apiUrl/breed/${breed.breed}/images/random/10';

  String _breedWithSubBreedEndpointUrl(Breed breed) =>
      '$_apiUrl/breed/${breed.breed}/${breed.subBreed}/images/random/10';

  Future<Map<String, dynamic>> fetchDogs() async {
    final url = Uri.parse(_dogListEndpointUrl);
    final response = await get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    final messageMap = Map<String, dynamic>.from(responseMap[_messageKey]);
    return messageMap;
  }

  Future<List<String>> fetchImages(Breed breed) async {
    final hasSubBreed = breed.subBreed != null;
    final url = Uri.parse(hasSubBreed
        ? _breedWithSubBreedEndpointUrl(breed)
        : _breedPhotoEndpointUrl(breed));
    final response = await get(url);
    Map<String, dynamic> responseMapImages = json.decode(response.body);
    final messageImages = List<String>.from(responseMapImages[_messageKey]);
    return messageImages;
  }
}
