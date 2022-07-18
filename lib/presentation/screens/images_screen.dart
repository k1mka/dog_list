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
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('ImagesScreen'),
      ),
      body: FutureBuilder<List<String>>(
        future: repo.getAlbum(widget.breed),
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
            // PageView(
            //   scrollDirection: Axis.vertical,
            //   children: [
            //     for (var url in snapshot.data!)
            //       Image.network(
            //         url,
            //         height: MediaQuery.of(context).size.height,
            //         width: MediaQuery.of(context).size.width,
            //         fit: BoxFit.cover,
            //       ),
            //   ],
            // ),
            // PageView.builder(
            //   scrollDirection: Axis.vertical,
            //   itemCount: snapshot.data!.length,
            //   itemBuilder: (context, i) => Image.network(
            //     snapshot.data![i],
            //     height: MediaQuery.of(context).size.height,
            //     width: MediaQuery.of(context).size.width,
            //     fit: BoxFit.cover,
            //   ),
            // );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
