enum ComputationMethods {
  LEFT_RECTANGLE,
  CENTER_RECTANGLE,
  RIGHT_RECTANGLE,
  TRAPEZOID,
  SIMPSON
}

extension MethodToString on ComputationMethods {
  String toStr() => this.toString().substring(this.toString().indexOf('.') + 1);
}
