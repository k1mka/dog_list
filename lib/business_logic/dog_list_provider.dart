import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDogListProvider = StateNotifierProvider(
  (ref) {
    final repository = ref.read(repositoryProvider);
    return DogListProvider(repository);
  },
);

class DogListProvider extends StateNotifier<List<Breed>> {
  final Repository repo;

  DogListProvider(this.repo) : super([]);
  getDogs() async {
    final dogList = await repo.fetchDogs();
    return dogList;
  }
}
