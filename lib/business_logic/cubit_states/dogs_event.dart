import 'package:array_names/data/models/breed.dart';

abstract class DogsEvent {}

class LoadingDogsEvent extends DogsEvent {}

class FireBaseAnalyticEvent extends DogsEvent {
  FireBaseAnalyticEvent(this.breed);
  final Breed breed;
}
