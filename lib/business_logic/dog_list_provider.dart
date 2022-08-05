// import 'package:array_names/data/models/breed.dart';
// import 'package:array_names/data/repositories/repository.dart';
// import 'package:array_names/service_locator.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final getDogListProvider = StateNotifierProvider<DogListProvider, List<Breed>>(
//   (ref) {
//     final repository = ref.read(repositoryProvider);
//     final provider = DogListProvider(repository);
//     return provider;
//   },
// );
//
// class DogListProvider extends StateNotifier<List<Breed>> {
//   final Repository repo;
//
//   DogListProvider(this.repo) : super([]);
//   void getDogs() async {
//     final dogList = await repo.fetchDogs();
//     state = dogList;
//   }
// }
