import 'package:comp_math_lab3/domain/models/tokens/token.dart';

class Equation {
  final List<Token> _tokens;
  Equation(List<Token> _tokens) : _tokens = _tokens;

  double compute(double x) {
    double result = 0.0;
    _tokens.forEach((element) {
      result += element.compute(x);
    });
    return result;
  }

  @override
  String toString() {
    var result = "";

    _tokens.forEach((element) {
      result += element.toString();
    });

    return '$result = 0';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Equation &&
          runtimeType == other.runtimeType &&
          _tokens == other._tokens;

  @override
  int get hashCode => _tokens.hashCode;
}
