import 'package:array_names/business_logic/dog_list_cubit.dart';
import 'package:array_names/data/models/breed.dart';
import 'package:array_names/presentation/widgets/breed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogListLayout extends StatefulWidget {
  const DogListLayout({Key? key}) : super(key: key);

  @override
  State<DogListLayout> createState() => _DogListLayoutState();
}

class _DogListLayoutState extends State<DogListLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('DogsListScreen'),
        ),
        body: Center(
          child: BlocBuilder<DogListCubit, List<Breed>>(
              builder: (context, breedList) => ListView.separated(
                    itemCount: breedList.length,
                    itemBuilder: (_, index) => BreedWidget(breedList[index]),
                    separatorBuilder: (_, __) => const Divider(thickness: 4),
                  )),
        ));
  }

  @override
  void initState() {
    super.initState();
    context.read<DogListCubit>().cubitFetchDogs();
  }
}
