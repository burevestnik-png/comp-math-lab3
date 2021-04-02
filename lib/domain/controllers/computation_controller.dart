import 'package:comp_math_lab3/domain/models/computation_methods.dart';
import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:comp_math_lab3/domain/models/methods/computation_method.dart';
import 'package:comp_math_lab3/domain/models/methods/left_rectangle_computation_method.dart';
import 'package:get/get.dart';

class ComputationController extends GetxController {
  final Map<ComputationMethods, ComputationMethod> _methods = {
    ComputationMethods.LEFT_RECTANGLE: LeftRectangleComputationMethod()
  };

  void solve({
    required Equation equation,
    required double a,
    required double b,
    required double accuracy,
    required int n,
    required ComputationMethods method,
  }) {
    _methods[method]!.solve(equation, a, b, accuracy, n);
  }
}
