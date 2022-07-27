import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/data/services/network_service.dart';

class RepositoryImpl implements Repository {
  final NetworkService networkService;

  RepositoryImpl(this.networkService);

  @override
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
    return myDogsList;
  }

  @override
  Future<List<String>> getAlbum(Breed breed) async {
    final images = await networkService.fetchImages(breed);
    return images;
  }
}
