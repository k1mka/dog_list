import 'package:http/http.dart';

class NetworkService {
  void fetchDogs() async {
    var url = Uri.parse('https://dog.ceo/api/breeds/list/all');
    var response = await get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
