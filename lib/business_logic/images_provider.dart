import '../data/models/breed.dart';
import '../data/repositories/repository.dart';

class ImagesProvider {
  final Repository repo;

  const ImagesProvider(this.repo);

  Future<List<String>> getImages(Breed breed) async {
    final dogsImages = await repo.getAlbum(breed);
    return dogsImages;
  }
}
