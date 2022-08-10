import 'package:array_names/business_logic/cubit_states/images_state.dart';
import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogsImagesCubit extends Cubit<ImagesState> {
  final Repository repo;

  DogsImagesCubit(this.repo) : super(InitialState());

  void cubitGetImages(Breed breed) async {
    emit(LoadingDogsImages());
    try {
      final getImages = await repo.getAlbum(breed);
      emit(LoadedImages(getImages));
    } catch (e) {
      emit(ImagesError(e));
    }
  }
}
