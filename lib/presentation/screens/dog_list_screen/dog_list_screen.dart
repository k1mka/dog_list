import 'package:array_names/data/models/breed.dart';
import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/data/services/network_service.dart';
import 'package:array_names/presentation/widgets/breed_widget.dart';
import 'package:flutter/material.dart';

class DogsListScreen extends StatefulWidget {
  const DogsListScreen({Key? key}) : super(key: key);

  @override
  State<DogsListScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DogsListScreen> {
  final repo = Repository(NetworkService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DogsListScreen'),
      ),
      body: Center(
        child: FutureBuilder<List<Breed>>(
            future: repo.fetchDogs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                final breedList = snapshot.data!;
                return ListView.builder(
                  itemCount: breedList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      BreedWidget(breedList[index]),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
