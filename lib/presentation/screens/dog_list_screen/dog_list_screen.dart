import 'package:array_names/data/repositories/repository.dart';
import 'package:array_names/data/services/network_service.dart';
import 'package:array_names/presentation/widgets/list_item.dart';
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
        child: ListView(
          children: <Widget>[
            ElevatedButton(
              child: const Text('Press me!'),
              onPressed: () {
                repo.fetchDogs();
              },
            ),
            const ListItem(text: 'Австралийская овчарка'),
            const ListItem(text: 'Бельгийская овчарка'),
            const ListItem(text: 'Австралийский келпи'),
            const ListItem(text: 'Австралийский шелковистый терьер'),
            const ListItem(text: 'Аляскинский маламут'),
            const ListItem(text: 'Американская акита-ину'),
            const ListItem(text: 'Бордер-колли'),
            const ListItem(text: 'Американский бульдог'),
            const ListItem(text: 'Американский голый терьер'),
            const ListItem(text: 'Американский кокер-спаниель'),
            const ListItem(text: 'Английский бульдог'),
            const ListItem(text: 'Английский сеттер'),
            const ListItem(text: 'Аргентинский дог'),
          ],
        ),
      ),
    );
  }
}
