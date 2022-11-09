import 'package:array_names/business_logic/cubit_states/dogs_event.dart';
import 'package:array_names/business_logic/dog_list_bloc.dart';
import 'package:array_names/data/models/breed.dart';
import 'package:array_names/presentation/screens/images_screen/images_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedWidget extends StatelessWidget {
  const BreedWidget(
    this.breed, {
    Key? key,
  }) : super(key: key);

  final Breed breed;

  void _navigateToNextScreen(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagesScreen(
            breed: breed,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<DogListBloc>().add(FireBaseAnalyticEvent(breed));
        _navigateToNextScreen(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          breed.fullName,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
