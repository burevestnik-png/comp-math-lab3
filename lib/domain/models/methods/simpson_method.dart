import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:comp_math_lab3/domain/models/methods/method.dart';
import 'package:comp_math_lab3/domain/utils/pair.dart';

class SimpsonMethod extends Method {
  SimpsonMethod() : super(Methods.SIMPSON);

  @override
  void solve(
    Equation equation,
    double a,
    double b,
    double accuracy,
    int n,
  ) {
    var h = findStep(a, b, n.toDouble());
    double resultForN = 0.0;
    double resultFor2N = _findArea(n, h, _formDots(equation, a, h, n));
    do {
      h /= 2;
      n *= 2;

      resultForN = resultFor2N;
      resultFor2N = _findArea(n, h, _formDots(equation, a, h, n));
    } while ((resultForN - resultFor2N).abs() > accuracy);

    logService.println("Answer is: $resultFor2N");
  }

  double _findArea(
    int n,
    double h,
    List<Pair<double, double>> dots,
  ) {
    double oddSum = 0;
    double evenSum = 0;
    for (var i = 1; i < n; i++) {
      if (i % 2 == 1)
        oddSum += dots[i].value;
      else
        evenSum += dots[i].value;
    }

    return h / 3 * (dots[0].value + 4 * oddSum + 2 * evenSum + dots[n].value);
  }

  List<Pair<double, double>> _formDots(
    Equation equation,
    double a,
    double h,
    int n,
  ) {
    List<Pair<double, double>> dots = [];
    for (var i = 0; i <= n; i++) {
      dots.add(Pair(a + i * h, equation.compute(a + i * h)));
    }
    return dots;
  }
}
