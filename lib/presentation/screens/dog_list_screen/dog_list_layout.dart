import 'package:array_names/business_logic/dog_list_provider.dart';

import 'package:array_names/presentation/widgets/breed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DogListLayout extends ConsumerStatefulWidget {
  const DogListLayout({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => DogListLayoutState();
}

class DogListLayoutState extends ConsumerState<ConsumerStatefulWidget> {
  @override
  void initState() {
    ref.read(getDogListProvider.notifier).getDogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final breedList = ref.watch(getDogListProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('DogsListScreen'),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: breedList.length,
          itemBuilder: (_, index) => BreedWidget(breedList[index]),
          separatorBuilder: (_, __) => const Divider(thickness: 4),
        ),
      ),
    );
  }
}
