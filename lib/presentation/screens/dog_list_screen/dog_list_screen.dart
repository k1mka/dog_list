import 'package:array_names/business_logic/dog_list_provider.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/presentation/screens/dog_list_screen/dog_list_layout.dart';
import 'package:array_names/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DogsListScreen extends StatelessWidget {
  const DogsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<DogListProvider>(
      create: (_) => DogListProvider(getIt<Repository>()),
      child: const DogListLayout(),
    );
  }
}
