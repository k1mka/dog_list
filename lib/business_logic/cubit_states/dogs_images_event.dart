import 'package:array_names/data/models/breed.dart';

abstract class DogsImagesEvent {}

class LoadingImagesEvent extends DogsImagesEvent {
  Breed breed;

  LoadingImagesEvent(this.breed);
}
