import 'package:comp_math_lab3/presentation/styles/text_styles.dart';
import 'package:flutter/material.dart';

class OptionTextfield extends StatelessWidget {
  final String content;
  final void Function(String)? onChange;

  OptionTextfield({this.content = "", required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        fieldText(content, size: TextSize.SMALL),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: onChange,
            ),
          ),
        ),
      ],
    );
  }
}
