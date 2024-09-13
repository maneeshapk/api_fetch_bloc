import 'package:flutter/material.dart';

class Imagewidget extends StatelessWidget {
  final String imagepath;
  final double height;
  final double width;
  const Imagewidget({super.key, required this.imagepath, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height*height,
      width:MediaQuery.of(context).size.width*width, 
      child: Image.network(imagepath));
  }
}
//  manasilayooo refactoring??.ahh ok ahnu