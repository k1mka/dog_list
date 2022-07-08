import 'dart:convert';
import 'package:http/http.dart';

class NetworkService {
  Future<Map<String, dynamic>> fetchDogs() async {
    final url = Uri.parse('https://dog.ceo/api/breeds/list/all');
    final response = await get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    final messageMap = Map<String, dynamic>.from(responseMap['message']);
    return messageMap;
  }
}
