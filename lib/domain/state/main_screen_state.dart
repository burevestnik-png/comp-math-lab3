import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:comp_math_lab3/domain/models/tokens/const_token.dart';
import 'package:comp_math_lab3/domain/models/tokens/polynomial_token.dart';
import 'package:comp_math_lab3/domain/models/tokens/token.dart';
import 'package:comp_math_lab3/domain/services/drawing_service.dart';
import 'package:comp_math_lab3/domain/state/state.dart';
import 'package:get/get.dart';

class MainScreenState extends IState {
  final drawService = DrawingService();
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
  }

  void onEquationChange(Equation value) => currentEquation.value = value;

  void onAChange(double value) => a.value = value;

  void onBChange(double value) => b.value = value;

  void onAccuracyChange(double value) => accuracy.value = value;
}
