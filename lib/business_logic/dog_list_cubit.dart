import 'package:array_names/data/models/breed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/repository.dart';

class DogListCubit extends Cubit<List<Breed>> {
  Repository repo;
  DogListCubit(this.repo) : super([]);

  void cubitFetchDogs() async => emit(await repo.fetchDogs());
}
