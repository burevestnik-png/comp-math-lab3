import 'package:comp_math_lab3/domain/state/main_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class OptionsWidget extends GetView<MainScreenState> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: controller.dropDownValue.value,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) =>
          controller.onDropDownValueChange(newValue!),
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
