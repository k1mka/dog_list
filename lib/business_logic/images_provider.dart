import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service_locator.dart';

final getImagesProvider = StateNotifierProvider(
  (ref) {
    final repository = ref.read(repositoryProvider);
    return ImagesProvider(repository);
  },
);

class ImagesProvider extends StateNotifier<List<String>> {
  final Repository repo;
  ImagesProvider(this.repo) : super([]);

  void getImages(Breed breed) async {
    final dogsImages = await repo.getAlbum(breed);
    state = dogsImages;
  }
}
