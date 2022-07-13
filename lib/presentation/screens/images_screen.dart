import 'package:array_names/data/models/breed.dart';
import 'package:flutter/material.dart';

class ImagesScreen extends StatefulWidget {
  final Breed breed;
  const ImagesScreen({Key? key, required this.breed}) : super(key: key);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('ImagesScreen'),
      ),
      body: Center(child: Text(widget.breed.fullName)),
    );
  }
}
