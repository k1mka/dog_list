import 'package:array_names/business_logic/images_provider.dart';
import 'package:array_names/data/models/breed.dart';
import 'package:flutter/material.dart';

class ImagesLayout extends StatelessWidget {
  final Breed breed;
  const ImagesLayout({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(breed.fullName),
      ),
      body: FutureBuilder<List<String>>(
        future: context.read<ImagesProvider>().getImages(breed),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return PageView(
              scrollDirection: Axis.vertical,
              children: snapshot.data!
                  .map<Image>((url) => Image.network(
                        url,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
