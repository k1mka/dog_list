import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/services/network_service.dart';

class Repository {
  final NetworkService networkService;

  const Repository(this.networkService);

  Future<List<Breed>> fetchDogs() async {
    final messageMap = await networkService.fetchDogs();
    final dogMainBreeds = messageMap.keys.toList();
    final myDogsList = <Breed>[];
    for (var d in dogMainBreeds) {
      List putSubBreeds = messageMap[d];
      if (putSubBreeds.isEmpty) {
        myDogsList.add(Breed(d));
      } else {
        for (var s in putSubBreeds) {
          myDogsList.add(Breed(d, subBreed: s));
        }
      }
    }
    _printDogs(myDogsList);
    return myDogsList;
  }

  void _printDogs(List<Breed> list) {
    for (var breed in list) {
      print('$breed \n');
    }
  }
}
