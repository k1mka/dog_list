import 'package:array_names/business_logic/cubit_states/dogs_images_event.dart';
import 'package:array_names/business_logic/cubit_states/images_state.dart';
import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogsImagesBloc extends Bloc<DogsImagesEvent, ImagesState> {
  final Repository repo;
  final Breed breed;

  DogsImagesBloc(this.repo, this.breed) : super(InitialState()) {
    on<LoadingImagesEvent>((event, emit) async {
      emit(LoadingDogsImages());
      try {
        final getImages = await repo.getAlbum(breed);
        emit(LoadedImages(getImages));
      } catch (e) {
        emit(ImagesError(e));
      }
    });
  }
}
