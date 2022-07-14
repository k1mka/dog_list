import 'package:array_names/data/models/breed.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/repository.dart';
import '../../data/services/network_service.dart';

class ImagesScreen extends StatefulWidget {
  final Breed breed;
  const ImagesScreen({Key? key, required this.breed}) : super(key: key);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  final repo = Repository(NetworkService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('ImagesScreen'),
      ),
      body: FutureBuilder<List<String>>(
        future: repo.getAlbum(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Image.network(snapshot.data![0]);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
