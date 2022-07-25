import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/data/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../business_logic/images_provider.dart';
import 'images_screen_layout.dart';

class ImagesScreen extends StatelessWidget {
  final Breed breed;
  final repo = Repository(NetworkService());
  ImagesScreen({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ImagesProvider>(
      create: (_) => ImagesProvider(repo),
      child: ImagesLayout(
        breed: breed,
      ),
    );
  }
}
