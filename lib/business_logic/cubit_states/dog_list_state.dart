import 'package:array_names/data/models/breed.dart';

abstract class DogListState {}

class InitialState extends DogListState {}

class LoadingDogs extends DogListState {}

class LoadedDogs extends DogListState {
  final List<Breed> breedList;

  LoadedDogs(this.breedList);
}

class ErrorDogs extends DogListState {
  final Object exception;

  ErrorDogs(this.exception);
}
