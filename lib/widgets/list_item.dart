import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String text;

  const ListItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Text(
          text,
          maxLines: 10,
          style: const TextStyle(color: Colors.blueGrey, fontSize: 40),
        ),
      ],
    );
  }
}
