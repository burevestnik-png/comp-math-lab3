import 'package:comp_math_lab3/domain/state/graph_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraphScreen extends StatelessWidget {
  static final String id = '/';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GraphScreenState>(
      create: (context) => GraphScreenState(),
      child: Consumer<GraphScreenState>(
        builder: (context, value, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text(value.equation.toString()),
            ),
          );
        },
      ),
    );
  }
}
