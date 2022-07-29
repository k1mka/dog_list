import 'package:array_names/data/models/breed.dart';
import 'package:flutter/material.dart';

import 'images_screen_layout.dart';

class ImagesScreen extends StatelessWidget {
  final Breed breed;

  const ImagesScreen({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImagesLayout(breed: breed);
  }
}
