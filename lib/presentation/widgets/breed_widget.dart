import 'package:array_names/data/models/breed.dart';
import 'package:flutter/material.dart';

class BreedWidget extends StatelessWidget {
  const BreedWidget(
    this.breed, {
    Key? key,
  }) : super(key: key);

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        breed.fullName,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
