import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:comp_math_lab3/domain/state/main_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class OptionsWidget extends GetView<MainScreenState> {
  List<DropdownMenuItem<Equation>> buildDropDownMenuItems(
      List<Equation> equations) {
    return equations.map<DropdownMenuItem<Equation>>((Equation equation) {
      return DropdownMenuItem(
        child: Text(equation.toString()),
        value: equation,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Equation>(
      value: controller.currentEquation.value,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (Equation? newValue) =>
          controller.onDropDownValueChange(newValue!),
      items: buildDropDownMenuItems(controller.equations),
    );
  }
}
