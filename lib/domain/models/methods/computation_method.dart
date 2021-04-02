import 'package:comp_math_lab3/domain/controllers/log_controller.dart';
import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:get/get.dart';

abstract class ComputationMethod {
  final logService = Get.find<LogController>();

  void solve(
    Equation equation,
    double a,
    double b,
    double accuracy,
    int n,
  );

  double findStep(double a, double b, double n) => (b - a) / n;
}
