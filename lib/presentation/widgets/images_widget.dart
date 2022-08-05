import 'package:flutter/widgets.dart';

class ImageWidget extends StatelessWidget {
  final String link;
  const ImageWidget({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      link,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}
