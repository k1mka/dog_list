import 'package:http/http.dart';

class NetworkService {
  void fetchDogs() async {
    var url = Uri.parse('https://dog.ceo/api/breeds/list/all');
    var response = await post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await read(Uri.parse('https://example.com/foobar.txt')));
  }
}
