import 'package:array_names/data/models/breed.dart';

abstract class Repository {
  Future<List<Breed>> fetchDogs();

  Future<List<String>> getAlbum(Breed breed);
}
