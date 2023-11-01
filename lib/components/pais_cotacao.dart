import 'package:flutter/cupertino.dart';

class PaisCotacao extends StatelessWidget {
  final String image;
  final double width;

  const PaisCotacao({required this.image, required this.width}) : super();

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: image,
        child:
        Image.asset(image,fit: BoxFit.contain,)
        // Image(
        //   image: CachedNetworkImageProvider(image),
        //   fit: BoxFit.contain,
        // ),
      ),
    );
  }
}
