import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/data/services/network_service.dart';
import 'package:array_names/presentation/widgets/list_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/breed.dart';

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
                  itemBuilder: (BuildContext context, int index) {
                    final breed = breedList[index];
                    return Text(
                      breed.fullName,
                      style: const TextStyle(fontSize: 30),
                    );
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
