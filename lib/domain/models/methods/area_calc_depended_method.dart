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
  void solve(
    Equation equation,
    double a,
    double b,
    double accuracy,
    int n,
  ) {
    var bindedAreaCallback = (double h) => areaCallback(h, equation, a);

    var h = findStep(a, b, n.toDouble());
    double resultForN = 0.0;
    double resultFor2N = findArea(n, bindedAreaCallback(h));
    do {
      h /= 2;
      n *= 2;

      resultForN = resultFor2N;
      resultFor2N = findArea(n, bindedAreaCallback(h));
    } while ((resultForN - resultFor2N).abs() > accuracy);

    logService.println("Answer is: $resultFor2N");
  }
}
