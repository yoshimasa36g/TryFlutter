import 'package:flutter/cupertino.dart';

class CircleImage extends StatelessWidget {
  final String url;
  final double size;

  CircleImage({this.url, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(url))),
    );
  }
}
