abstract class ImagesState {}

class InitialState extends ImagesState {}

class LoadingDogsImages extends ImagesState {}

class LoadedImages extends ImagesState {
  final List<String> imagesList;
  LoadedImages(this.imagesList);
}

class ImagesError extends ImagesState {
  final Object exception;

  ImagesError(this.exception);
}
