import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  final String entertext;
  final double paddingvalue;
  
  const Textwidget({super.key, required this.entertext, required this.paddingvalue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(paddingvalue),
      child: Text(entertext, style: const TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}