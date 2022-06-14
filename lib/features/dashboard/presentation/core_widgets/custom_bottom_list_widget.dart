import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectedPageButton extends StatelessWidget {
  SelectedPageButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.isSelected,
      required this.textAlignCenter})
      : super(key: key);
  final VoidCallback? onPressed;
  final String label;
  final bool isSelected;
  final bool textAlignCenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: isSelected ? Colors.grey.shade200 : null,
      color: RandomHexColor().colorRandom(),
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Text(label,
              textAlign: textAlignCenter ? TextAlign.center : null,
              maxLines: 1),
        ),
      ),
    );
  }
}

class RandomHexColor {
  List<Color> hexColor = [
    Colors.amber[100]!,
    Colors.blueGrey[100]!,
    Colors.green[100]!,
    Colors.red[100]!,
    Colors.blue[100]!,
    Colors.brown[100]!,
    Colors.lime[100]!,
    /*Colors.pink[100]!,
    Colors.cyan[100]!,
    Colors.deepPurple[100]!,*/
  ];

  static final _random = Random();

  Color colorRandom() {
    return hexColor[_random.nextInt(7)];
  }
}
