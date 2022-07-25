import 'package:array_names/business_logic/dog_list_provider.dart';
import 'package:array_names/data/models/breed.dart';
import 'package:array_names/presentation/widgets/breed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DogListLayout extends StatelessWidget {
  const DogListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('DogsListScreen'),
      ),
      body: Center(
        child: FutureBuilder<List<Breed>>(
            future: context.read<DogListProvider>().getDogs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                final breedList = snapshot.data!;
                return ListView.separated(
                  itemCount: breedList.length,
                  itemBuilder: (_, index) => BreedWidget(breedList[index]),
                  separatorBuilder: (_, __) => const Divider(thickness: 4),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
