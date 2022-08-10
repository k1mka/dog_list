import 'package:array_names/business_logic/dog_list_cubit.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/data/services/get_it.dart';
import 'package:array_names/presentation/screens/dog_list_screen/dog_list_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogsListScreen extends StatelessWidget {
  const DogsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogListCubit>(
      create: (_) => DogListCubit(getIt<Repository>()),
      child: const DogListLayout(),
    );
  }
}
