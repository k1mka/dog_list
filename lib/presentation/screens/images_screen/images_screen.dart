import 'package:array_names/business_logic/dogs_images_bloc.dart';
import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'images_screen_layout.dart';

class ImagesScreen extends StatelessWidget {
  final Breed breed;

  const ImagesScreen({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogsImagesBloc>(
      create: (context) => DogsImagesBloc(getIt<Repository>()),
      child: ImagesLayout(breed: breed),
    );
  }
}
