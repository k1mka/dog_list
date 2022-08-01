import 'package:array_names/data/models/breed.dart';
import 'package:array_names/presentation/widgets/images_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../business_logic/images_provider.dart';

class ImagesLayout extends ConsumerStatefulWidget {
  final Breed breed;

  const ImagesLayout({Key? key, required this.breed}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ImagesLayoutState();
}

class ImagesLayoutState extends ConsumerState<ConsumerStatefulWidget> {
  @override
  void initState() {
    ref.read(getImagesProvider.notifier).getImages(
          (widget as ImagesLayout).breed,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dogsImages = ref.watch(getImagesProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text((widget as ImagesLayout).breed.fullName),
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          for (var url in dogsImages) ImageWidget(link: url),
        ],
      ),
    );
  }
}
