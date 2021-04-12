import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:comp_math_lab3/domain/models/methods/method.dart';
import 'package:comp_math_lab3/domain/state/main_screen_state.dart';
import 'package:comp_math_lab3/presentation/styles/text_styles.dart';
import 'package:comp_math_lab3/presentation/widgets/option_dropdown_widget.dart';
import 'package:comp_math_lab3/presentation/widgets/option_logger_widget.dart';
import 'package:comp_math_lab3/presentation/widgets/option_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Options extends GetView<MainScreenState> {
  _space() => SizedBox(height: 10);

  _spacedDivider() => Column(children: [
        _space(),
        Divider(),
        _space(),
      ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          fieldText("Choose equation:"),
          OptionDropdown<Equation>(
            items: controller.equations,
            obs: controller.currentEquation,
            onChange: controller.onEquationChange,
          ),
          _space(),
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
          _space(),
          OptionDropdown<Methods>(
            text: "Method:",
            items: Methods.values,
            obs: controller.method,
            onChange: controller.onMethodChange,
            toStr: (method) => method.toStr(),
          ),
          _spacedDivider(),
          TextButton(
            onPressed: controller.onComputeAction,
            child: Text("Compute"),
          ),
          _spacedDivider(),
          OptionLogger(),
        ],
      ),
    );
  }
}
