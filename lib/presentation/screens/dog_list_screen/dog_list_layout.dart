import 'package:array_names/business_logic/cubit_states/dog_list_state.dart';
import 'package:array_names/business_logic/cubit_states/dogs_event.dart';
import 'package:array_names/business_logic/dog_list_cubit.dart';
import 'package:array_names/presentation/widgets/breed_widget.dart';
import 'package:array_names/presentation/widgets/dog_list_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogListLayout extends StatefulWidget {
  const DogListLayout({Key? key}) : super(key: key);

  @override
  State<DogListLayout> createState() => _DogListLayoutState();
}

class _DogListLayoutState extends State<DogListLayout> {
  @override
  void initState() {
    super.initState();
    context.read<DogListBloc>().add(LoadingDogsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('DogsListScreen'),
      ),
      body: Center(
        child: BlocBuilder<DogListBloc, DogListState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const Center(child: Text('expectation'));
            } else if (state is ErrorDogs) {
              return const DogListErrorWidget();
            } else if (state is LoadingDogs) {
              return const CircularProgressIndicator();
            } else if (state is LoadedDogs) {
              return ListView.separated(
                itemCount: state.breedList.length,
                itemBuilder: (_, index) => BreedWidget(state.breedList[index]),
                separatorBuilder: (_, __) => const Divider(thickness: 4),
              );
            } else {
              throw Exception('unprocessed state $state in DogListLayout');
            }
          },
        ),
      ),
    );
  }
}
