import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:fl_chart/fl_chart.dart';

enum _Mode { MAX, MIN }

class GraphService {
  static FlSpot min(
    Equation equation,
    double from,
    double to, [
    double accuracy = 0.01,
  ]) {
    FlSpot minDot = FlSpot(0, double.negativeInfinity);
    for (var i = from; i <= to; i += accuracy) {
      if (minDot.y > equation.compute(i)) {
        minDot = FlSpot(i, equation.compute(i));
      }
    }
    return minDot;
  }

  static FlSpot max(
    Equation equation,
    double from,
    double to, [
    double accuracy = 0.01,
  ]) {
    FlSpot minDot = FlSpot(0, double.infinity);
    for (var i = from; i <= to; i += accuracy) {
      if (minDot.y < equation.compute(i)) {
        minDot = FlSpot(i, equation.compute(i));
      }
    }
    return minDot;
  }

  FlSpot _findExtremum(
    Equation equation,
    double from,
    double to, [
    _Mode mode = _Mode.MAX,
    double accuracy = 0.01,
  ]) {
    FlSpot dot = FlSpot(
        0, mode == _Mode.MAX ? double.negativeInfinity : double.infinity);
    for (var i = from; i <= to; i += accuracy) {
      switch (mode) {
        case _Mode.MAX:
          if (dot.y < equation.compute(i)) {
            dot
          }
      }
      if (dot.y < equation.compute(i)) {
        dot = FlSpot(i, equation.compute(i));
      }
    }
    return dot;
  }
}
