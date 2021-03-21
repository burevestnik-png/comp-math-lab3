import 'package:comp_math_lab3/domain/models/equation.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DrawingService {
  LineChartData drawAxis({
    double minX = -10.0,
    double maxX = 10.0,
    double minY = -10.0,
    double maxY = 10.0,
  }) {
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
      lineBarsData: [
        ..._drawAxis(minX, maxX, minY, maxY),
      ],
    );
  }

  void drawGraph(
    Equation equation,
    LineChartData data, {
    double min = -10.0,
    double max = 10.0,
    double accuracy = 0.01,
  }) {
    List<FlSpot> dots = [];
    for (var i = min; i < max; i += accuracy) {
      dots.add(FlSpot(i, equation.compute(i)));
    }
    data.lineBarsData.add(LineChartBarData(
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
      [..._drawAxisX(minX, maxX), ..._drawAxisY(minY, maxY)];

  List<LineChartBarData> _drawAxisY(
    double minY,
    double maxY,
  ) {
    List<FlSpot> dots = [];
    for (var i = minY; i <= maxY; i++) {
      dots.add(FlSpot(0, i));
    }

    return [
      LineChartBarData(
        spots: dots,
        colors: [Colors.black],
        barWidth: 3,
        dotData: FlDotData(
          show: false,
        ),
      ),
    ];
  }

  List<LineChartBarData> _drawAxisX(
    double minX,
    double maxX,
  ) {
    List<FlSpot> dots = [];
    for (var i = minX; i <= maxX; i++) {
      dots.add(FlSpot(i, 0));
    }

    return [
      LineChartBarData(
        spots: dots,
        colors: [Colors.black],
        barWidth: 3,
        dotData: FlDotData(
          show: false,
        ),
      ),
    ];
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
