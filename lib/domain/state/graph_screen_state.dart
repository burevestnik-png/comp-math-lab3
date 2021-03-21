import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:comp_math_lab3/domain/models/tokens/polynomial_token.dart';
import 'package:comp_math_lab3/domain/models/tokens/token.dart';
import 'package:comp_math_lab3/domain/services/drawing_service.dart';
import 'package:comp_math_lab3/domain/state/state.dart';

class GraphScreenState extends IState {
  final equation =
      Equation(<Token>[PolynomialToken.basic(power: 2.0, factor: 1.0)]);

  final drawService = DrawingService();
}
