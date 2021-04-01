import 'package:comp_math_lab3/domain/models/equation.dart';

abstract class ComputationMethod {
  void solve({
    required Equation equation,
    required double a,
    required double b,
    required double accuracy,
    required int n,
  });
}
