import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/repositories/repository.dart';

class DogListProvider {
  final Repository _repo;

  DogListProvider(this._repo);

  Future<List<Breed>> getDogs() async {
    final dogList = await _repo.fetchDogs();
    return dogList;
  }
}
