import 'package:comp_math_lab3/presentation/widgets/equations_widget.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Choose equation:"),
        Equations(),
      ],
    );
  }
}
