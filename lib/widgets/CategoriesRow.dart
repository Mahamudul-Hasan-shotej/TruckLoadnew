import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  final String text;
  final Color color;
  CategoriesRow({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 10,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: color,
            ),
          ),
          SizedBox(width: 05),
          Text(text)
        ],
      ),
    );
  }
}
