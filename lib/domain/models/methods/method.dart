import 'package:comp_math_lab3/domain/controllers/log_controller.dart';
import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:get/get.dart';

enum Methods {
  LEFT_RECTANGLE,
  CENTER_RECTANGLE,
  RIGHT_RECTANGLE,
  TRAPEZOID,
  SIMPSON
}

extension MethodToString on Methods {
  String toStr() => this.toString().substring(this.toString().indexOf('.') + 1);
}

abstract class Method {
  final logService = Get.find<LogController>();
  final Methods type;

  Method(this.type);

  void solve(
    Equation equation,
    double a,
    double b,
    double accuracy,
    int n,
  );

  double findStep(double a, double b, double n) => (b - a) / n;
}
