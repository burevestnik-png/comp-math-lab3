import 'package:comp_math_lab3/domain/state/graph_screen_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraphScreen extends StatelessWidget {
  static final String id = '/';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GraphScreenState>(
      create: (context) => GraphScreenState(),
      child: Consumer<GraphScreenState>(
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
  }
}
