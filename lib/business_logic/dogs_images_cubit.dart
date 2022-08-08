import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogsImagesCubit extends Cubit<List<String>> {
  final Repository repo;

  DogsImagesCubit(this.repo) : super([]);

  void cubitGetImages(Breed breed) async => emit(await repo.getAlbum(breed));
}
