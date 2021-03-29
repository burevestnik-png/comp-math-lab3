import 'package:comp_math_lab3/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:comp_math_lab3/domain/models/tokens/const_token.dart';
import 'package:comp_math_lab3/domain/models/tokens/polynomial_token.dart';
import 'package:comp_math_lab3/domain/models/tokens/token.dart';
import 'package:comp_math_lab3/domain/state/state.dart';
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

  @override
  void onInit() {
    super.onInit();
    currentEquation = equations[0].obs;
    _redraw();
  }

  void onEquationChange(Equation value) {
    currentEquation.value = value;
    _redraw();
  }

  void onAChange(double value) {
    if (value > b.value!) return;
    a.value = value;
    _redraw();
  }

  void onBChange(double value) {
    if (value < a.value!) return;
    b.value = value;
    _redraw();
  }

  void onAccuracyChange(double value) {
    if (value < 0.01 || value > 1) return;
    accuracy.value = double.tryParse(value.toStringAsFixed(3));
    _redraw();
  }

  void _redraw() => _drawingController.drawGraph(
        currentEquation.value!,
        min: a.value!,
        max: b.value!,
        accuracy: accuracy.value!,
      );
}
