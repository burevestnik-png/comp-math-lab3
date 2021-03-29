import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [
///   axisX
///   axisY
///   currentEquation
/// ]
class DrawingController extends GetxController {
  static const kCenterConst = 3;

  static const _kAxisXPlace = 0;
  static const _kAxisYPlace = 1;
  static const _kEquationPlace = 2;

  late final LineChartData chartData;
  late final List<LineChartBarData> _lines;

  @override
  void onInit() {
    super.onInit();
    _lines = _drawAxis(-10, 10, -10, 10);
    chartData = drawAxis();
  }

  LineChartData drawAxis({
    double minX = -10.0,
    double maxX = 10.0,
    double minY = -10.0,
    double maxY = 10.0,
  }) {
    _lines.clear();
    _lines.addAll(_drawAxis(minX, maxX, minY, maxY));

    return LineChartData(
      gridData: _drawGrid(),
      maxX: maxX,
      maxY: maxY,
      minX: minX,
      minY: minY,
      lineTouchData: LineTouchData(enabled: false),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: _drawTitles(),
        leftTitles: _drawTitles(),
      ),
      lineBarsData: _lines,
    );
  }

  void drawGraph(
    Equation equation, {
    double min = -10.0,
    double max = 10.0,
    double accuracy = 0.01,
  }) {
    if (_lines.asMap().containsKey(_kEquationPlace)) _lines.removeLast();

    if ((equation.min(min, max).y - chartData.minY).abs() > kCenterConst) {
      var previousMinY = chartData.minY;
      chartData.minY = equation.min(min, max).y - kCenterConst;
      chartData.maxY = chartData.maxY - previousMinY;

      List<FlSpot> newYAxisDots = [];
      for (var i = chartData.minY; i <= chartData.maxY; i++) {
        newYAxisDots.add(FlSpot(0, i));
      }
      chartData.lineBarsData[1].spots.clear();
      chartData.lineBarsData[1].spots.addAll(newYAxisDots);
    }

    List<FlSpot> dots = [];
    for (var i = min; i < max; i += accuracy) {
      if (equation.compute(i) < chartData.maxY &&
          equation.compute(i) > chartData.minY) {
        dots.add(FlSpot(i, equation.compute(i)));
      }
    }

    _lines.add(LineChartBarData(
      spots: dots,
      isCurved: true,
      dotData: FlDotData(
        show: false,
      ),
    ));
  }

  List<LineChartBarData> _drawAxis(
    double minX,
    double maxX,
    double minY,
    double maxY,
  ) =>
      [_drawAxisX(minX, maxX), _drawAxisY(minY, maxY)];

  LineChartBarData _drawAxisY(
    double minY,
    double maxY,
  ) {
    List<FlSpot> dots = [];
    for (var i = minY; i <= maxY; i++) {
      dots.add(FlSpot(0, i));
    }

    return LineChartBarData(
      spots: dots,
      colors: [Colors.black],
      barWidth: 3,
      dotData: FlDotData(
        show: false,
      ),
    );
  }

  LineChartBarData _drawAxisX(
    double minX,
    double maxX,
  ) {
    List<FlSpot> dots = [];
    for (var i = minX; i <= maxX; i++) {
      dots.add(FlSpot(i, 0));
    }

    return LineChartBarData(
      spots: dots,
      colors: [Colors.black],
      barWidth: 3,
      dotData: FlDotData(
        show: false,
      ),
    );
  }

  SideTitles _drawTitles() => SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff68737d),
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        getTitles: (value) => value.toInt().toString(),
        margin: 8,
      );

  FlGridData _drawGrid() => FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      );
}
