import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:comp_math_lab3/domain/models/methods/computation_method.dart';

class LeftRectangleComputationMethod extends ComputationMethod {
  @override
  void solve(
    Equation equation,
    double a,
    double b,
    double accuracy,
    int n,
  ) {
    var h = findStep(a, b, n.toDouble());

    var area = 0.0;
    for (var i = 0; i < n; ++i) {
      area += h * equation.compute(a + i * h);
    }

    logService.println("Area is $area");
  }
}
