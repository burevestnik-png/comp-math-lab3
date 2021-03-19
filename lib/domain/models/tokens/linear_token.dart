import 'package:comp_math_lab3/domain/models/tokens/token.dart';

class LinearToken extends Token {
  LinearToken(Sign sign, double factor) : super(sign, factor);

  LinearToken.basic() : this(Sign("+"), 1.0);

  @override
  double compute(double x) => sign.apply(factor * x);

  @override
  String toString() => '${sign.value}$factor * x';
}
