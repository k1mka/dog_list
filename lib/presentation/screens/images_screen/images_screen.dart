import 'package:array_names/business_logic/images_provider.dart';
import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'images_screen_layout.dart';

class ImagesScreen extends StatelessWidget {
  final Breed breed;

  const ImagesScreen({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ImagesProvider>(
      create: (_) => ImagesProvider(getIt<Repository>()),
      child: ImagesLayout(breed: breed),
    );
  }
}
