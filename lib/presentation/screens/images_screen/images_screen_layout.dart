import 'package:array_names/business_logic/cubit_states/images_state.dart';
import 'package:array_names/business_logic/dogs_images_cubit.dart';
import 'package:array_names/data/models/breed.dart';
import 'package:array_names/presentation/widgets/images_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesLayout extends StatefulWidget {
  final Breed breed;

  const ImagesLayout({Key? key, required this.breed}) : super(key: key);

  @override
  State<ImagesLayout> createState() => _ImagesLayoutState();
}

class _ImagesLayoutState extends State<ImagesLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(widget.breed.fullName),
      ),
      body:
          BlocBuilder<DogsImagesCubit, ImagesState>(builder: (context, state) {
        if (state is InitialState) {
          return const Center(child: Text('expectation'));
        } else if (state is ImagesError) {
          return const Text('Ошибка загрузки фотографий');
        } else if (state is LoadingDogsImages) {
          return const CircularProgressIndicator();
        } else if (state is LoadedImages) {
          return PageView(
            scrollDirection: Axis.vertical,
            children: [
              for (var url in state.imagesList) ImageWidget(link: url),
            ],
          );
        } else {
          throw Exception('unprocessed state $state in DogListLayout');
        }
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<DogsImagesCubit>().cubitGetImages(widget.breed);
  }
}
