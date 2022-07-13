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
        backgroundColor: Colors.black87,
        title: const Text('DogsListScreen'),
      ),
      body: Center(
        child: FutureBuilder<List<Breed>>(
            future: repo.fetchDogs(),
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
