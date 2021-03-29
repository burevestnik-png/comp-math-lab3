import 'package:comp_math_lab3/domain/state/main_screen_state.dart';
import 'package:comp_math_lab3/presentation/widgets/equations_widget.dart';
import 'package:comp_math_lab3/presentation/widgets/option_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Options extends GetView<MainScreenState> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Equations(),
          OptionTextfield(
            content: "Left border:",
            initialValue: controller.a.value.toString(),
            onChange: (String value) =>
                controller.onAChange(double.tryParse(value)!),
          ),
          OptionTextfield(
            content: "Right border:",
            initialValue: controller.b.value.toString(),
            onChange: (String value) =>
                controller.onBChange(double.tryParse(value)!),
          ),
          OptionTextfield(
            content: "Accuracy:",
            initialValue: controller.accuracy.value.toString(),
            onChange: (String value) =>
                controller.onAccuracyChange(double.tryParse(value)!),
          ),
        ],
      ),
    );
  }
}
