import 'dart:math';

import 'package:comp_math_lab3/domain/models/tokens/linear_token.dart';
import 'package:comp_math_lab3/domain/models/tokens/token.dart';

class PolynomialToken extends Token {
  final Token _token;
  final double _power;

  PolynomialToken(this._token, this._power, String sign, double factor)
      : super(Sign(sign), factor);

  PolynomialToken.basicPositive({
    required double power,
    required double factor,
  }) : this(LinearToken.basic(), power, Sign.plus, factor);

  PolynomialToken.basicNegative({
    required double power,
    required double factor,
  }) : this(LinearToken.basic(), power, Sign.minus, factor);

  @override
  double compute(double x) =>
      sign.apply(factor * pow(_token.compute(x), _power));

  @override
  String toString() => '${sign.value}$factor * ($_token)^$_power';
}
