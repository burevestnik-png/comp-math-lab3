import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:comp_math_lab3/domain/models/methods/method.dart';

abstract class AreaCalcDependedMethod extends Method {
  double Function(int) Function(double, Equation, double) areaCallback;

  static double Function(int) _defaultCallback(
    double h,
    Equation equation,
    double a,
  ) =>
      (int i) => 0.0;

  AreaCalcDependedMethod(
    Methods type, [
    this.areaCallback = _defaultCallback,
  ]) : super(type);

  @override
  double findArea(Equation equation, double a, double h, int n) {
    var bindedAreaCallback = areaCallback(h, equation, a);
    var area = 0.0;
    for (int i = 0; i < n; i++) {
      area += bindedAreaCallback(i);
    }
    return area;
  }
}
