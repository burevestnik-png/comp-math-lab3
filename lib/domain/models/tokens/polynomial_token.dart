import 'dart:math';

import 'package:comp_math_lab3/domain/models/tokens/linear_token.dart';
import 'package:comp_math_lab3/domain/models/tokens/token.dart';

class PolynomialToken extends Token {
  final Token _token;
  final double _power;

  PolynomialToken(this._token, this._power, Sign sign, double factor)
      : super(sign, factor);

  PolynomialToken.basic({
    required double power,
    required double factor,
  }) : this(LinearToken.basic(), power, Sign("+"), factor);

  @override
  double compute(double x) =>
      sign.apply(factor * pow(_token.compute(x), _power));

  @override
  String toString() => '${sign.value}$factor * ($_token)^$_power';
}
