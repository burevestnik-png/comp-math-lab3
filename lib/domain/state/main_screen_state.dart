import 'package:comp_math_lab3/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:comp_math_lab3/domain/models/tokens/const_token.dart';
import 'package:comp_math_lab3/domain/models/tokens/polynomial_token.dart';
import 'package:comp_math_lab3/domain/models/tokens/token.dart';
import 'package:comp_math_lab3/domain/state/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainScreenState extends IState {
  final DrawingController _drawingController = Get.find();
  final equations = <Equation>[
    Equation([
      PolynomialToken.basicPositive(power: 2.0, factor: 1.0),
    ]),
    Equation([
      PolynomialToken.basicPositive(power: 3, factor: 1),
      PolynomialToken.basicPositive(power: 2, factor: 2),
      PolynomialToken.basicNegative(power: 1, factor: 3),
      ConstToken(Sign.minus, 12)
    ]),
  ];

  late Rx<Equation> currentEquation;
  var a = (-5.0).obs;
  var b = 5.0.obs;
  var accuracy = 0.01.obs;

  final aController = TextEditingController();
  final bController = TextEditingController();
  final accuracyController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    currentEquation = equations[0].obs;
    aController.text = a.value!.toStringAsFixed(0);
    bController.text = b.value!.toStringAsFixed(0);
    accuracyController.text = accuracy.value.toString();

    _redraw();
  }

  void onFieldChange(
    String value, {
    required bool Function(double) isCorrect,
    required RxDouble obs,
    required TextEditingController textController,
  }) {
    var parsedValue = double.tryParse(value);
    if (parsedValue == null) {
      // TODO Show toast!
      return;
    }

    if (!isCorrect(parsedValue)) {
      textController.text = obs.value.toString();
      return;
    }

    obs.value = parsedValue;
    print('Redraw: a - ${a.value} b - ${b.value}');
    _redraw();
  }

  bool isACorrect(double value) => value < b.value!;

  bool isBCorrect(double value) => value > a.value!;

  bool isAccuracyCorrect(double value) => value >= 0.01 && value <= 1;

  void onEquationChange(Equation value) {
    currentEquation.value = value;
    _redraw();
  }

  void _redraw() => _drawingController.drawGraph(
        currentEquation.value!,
        min: a.value!,
        max: b.value!,
        accuracy: accuracy.value!,
      );
}
