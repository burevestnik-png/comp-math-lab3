import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:comp_math_lab3/domain/state/main_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Закостылено в [StatefulWidget], так как флаттер не может перерендрить
/// [DropdownButton], если меняется obs переменная в контроллере от GetX
class Equations extends StatefulWidget {
  @override
  _EquationsState createState() => _EquationsState();
}

class _EquationsState extends State<Equations> {
  late var _currentCrutchedEquation;
  final MainScreenState state = Get.find();

  @override
  void initState() {
    super.initState();
    _currentCrutchedEquation = state.currentEquation.value;
  }

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
      value: _currentCrutchedEquation,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (Equation? newValue) {
        state.onDropDownValueChange(newValue!);
        setState(() {
          _currentCrutchedEquation = newValue;
        });
      },
      items: buildDropDownMenuItems(state.equations),
    );
  }
}
