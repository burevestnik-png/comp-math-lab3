import 'package:comp_math_lab3/domain/state/main_screen_state.dart';
import 'package:comp_math_lab3/domain/state/state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenState> {
  static final String id = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bar"),
      ),
      body: Obx(() {
        var lineChartData = controller.drawService.drawAxis();
        // controller.drawService.drawGraph(controller.equation2, lineChartData);
        if (controller.state == ScreenState.IDLE) {}

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LineChart(
                lineChartData,
              ),
              FlatButton(
                onPressed: () {
                  controller.drawService
                      .drawGraph(controller.equation, lineChartData);
                },
                child: Text("test"),
              )
            ],
          ),
        );
      }),
    );
  }

/*@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainScreenState>(
      create: (context) => MainScreenState(),
      child: Consumer<MainScreenState>(
        builder: (context, state, _) {
          var lineChartData = state.drawService.drawAxis();
          state.drawService.drawGraph(state.equation2, lineChartData);

          return Scaffold(
            appBar: AppBar(
              title: Text(state.equation2.toString()),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LineChart(
                    lineChartData,
                  ),
                  FlatButton(
                    onPressed: () {
                      state.drawService
                          .drawGraph(state.equation, lineChartData);
                    },
                    child: Text("test"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }*/

}
