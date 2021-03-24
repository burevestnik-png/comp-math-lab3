import 'package:comp_math_lab3/domain/models/tokens/token.dart';

class LinearToken extends Token {
  LinearToken(String sign, double factor) : super(Sign(sign), factor);

  LinearToken.basic() : this(Sign.plus, 1.0);

  @override
  double compute(double x) => sign.apply(factor * x);

  @override
  String toString() => '${sign.value}$factor * x';
}
