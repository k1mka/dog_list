import 'package:array_names/presentation/screens/dog_list_screen/dog_list_screen.dart';
import 'package:flutter/material.dart';

class DogsApp extends StatelessWidget {
  const DogsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DogsListScreen(),
    );
  }
}
