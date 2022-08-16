import 'package:flutter/material.dart';

class DogListErrorWidget extends StatelessWidget {
  static const String errorText = 'Ошибка загрузки собак';
  static const double sizeClose = 50.0;

  const DogListErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.close,
              size: sizeClose,
              color: Colors.red,
            ),
            Text(
              errorText,
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
