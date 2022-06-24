import 'package:array_names/widgets/list_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: const <Widget>[
            ListItem(text: 'Австралийская овчарка'),
            ListItem(text: 'Бельгийская овчарка'),
            ListItem(text: 'Австралийский келпи'),
            ListItem(text: 'Австралийский шелковистый терьер'),
            ListItem(text: 'Аляскинский маламут'),
            ListItem(text: 'Американская акита-ину'),
            ListItem(text: 'Бордер-колли'),
            ListItem(text: 'Американский бульдог'),
            ListItem(text: 'Американский голый терьер'),
            ListItem(text: 'Американский кокер-спаниель'),
            ListItem(text: 'Английский бульдог'),
            ListItem(text: 'Английский сеттер'),
            ListItem(text: 'Аргентинский дог'),
          ],
        ),
      ),
    );
  }
}
