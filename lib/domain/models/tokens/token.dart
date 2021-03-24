abstract class Token {
  final Sign _sign;
  final double _factor;

  Token(this._sign, this._factor);

  double compute(double x);

  double get factor => _factor;
  Sign get sign => _sign;
}

class Sign {
  static const plus = "+";
  static const minus = "-";

  final String _sign;

  Sign(this._sign);

  double apply(double value) {
    switch (_sign) {
      case plus:
        return value;
      case minus:
        return -1 * value;
      default:
        throw "Unimplemented sign: $_sign";
    }
  }

  String get value => _sign;
  static bool isSign(String val) => val == "+" || val == "-";
}
