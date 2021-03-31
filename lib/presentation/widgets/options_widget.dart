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
          Divider(),
          OptionTextfield(
            content: "Left border:",
            controller: controller.aController,
            onChange: (String value) => controller.onDoubleFieldChange(
              value,
              isCorrect: controller.isACorrect,
              obs: controller.a,
              textController: controller.aController,
            ),
          ),
          OptionTextfield(
            content: "Right border:",
            controller: controller.bController,
            onChange: (String value) => controller.onDoubleFieldChange(
              value,
              isCorrect: controller.isBCorrect,
              obs: controller.b,
              textController: controller.bController,
            ),
          ),
          OptionTextfield(
            content: "Accuracy:",
            controller: controller.accuracyController,
            onChange: (String value) => controller.onDoubleFieldChange(
              value,
              isCorrect: controller.isAccuracyCorrect,
              obs: controller.accuracy,
              textController: controller.accuracyController,
            ),
          ),
          OptionTextfield(
            content: "n:",
            controller: controller.nController,
            onChange: (String value) => controller.onIntFieldChange(
              value,
              isCorrect: controller.isNCorrect,
              obs: controller.n,
              textController: controller.nController,
            ),
          ),
          Divider(),
          TextButton(onPressed: () {}, child: Text('Compute')),
        ],
      ),
    );
  }
}
