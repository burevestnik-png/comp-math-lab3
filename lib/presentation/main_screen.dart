import 'package:comp_math_lab3/domain/state/main_screen_state.dart';
import 'package:comp_math_lab3/presentation/widgets/options_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenState> {
  static final String id = '/';

  @override
  Widget build(BuildContext context) {
    var lineChartData = controller.drawService.drawAxis();
    // controller.drawService.drawGraph(controller.equation2, lineChartData);

    return Scaffold(
      appBar: AppBar(
        title: Text("bar"),
      ),
      body: Row(
        children: [
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.start,
            children: [Options()],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LineChart(
                  lineChartData,
                ),
                FlatButton(
                  onPressed: () {
                    controller.drawService
                        .drawGraph(controller.equations[0], lineChartData);
                  },
                  child: Obx(
                      () => Text("${controller.currentEquation.toString()}")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
