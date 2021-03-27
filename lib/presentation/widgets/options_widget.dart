import 'package:comp_math_lab3/presentation/styles/constants.dart';
import 'package:comp_math_lab3/presentation/widgets/equations_widget.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose equation:",
            style: TextStyle(
              fontSize: kFieldFontSize,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Equations(),
        ],
      ),
    );
  }
}
