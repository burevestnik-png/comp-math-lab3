import 'package:comp_math_lab3/domain/models/tokens/token.dart';

class ConstToken extends Token {
  ConstToken(String sign, double factor) : super(Sign(sign), factor);

  @override
  double compute(double x) => factor;

  @override
  String toString() => "${sign.value}$factor";
}
