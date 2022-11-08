class Breed {
  final String breed;
  final String? subBreed;

  Breed(this.breed, {this.subBreed});

  String get fullName => '$breed ${subBreed ?? ''}';

  String get getFullNameToFirebase => '$breed${subBreed ?? '_subBreed_null'}';

  @override
  String toString() {
    return 'Breed{breed: $breed, subBreed: $subBreed}';
  }
}
