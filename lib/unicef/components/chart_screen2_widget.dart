import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChartSreen2Widget extends StatefulWidget {
  List<int>? ids;
  ChartSreen2Widget({
    Key? key,
    this.ids,
  }) : super(key: key);

  @override
  _ChartSreen2WidgetState createState() => _ChartSreen2WidgetState();
}

class _ChartSreen2WidgetState extends State<ChartSreen2Widget> {
  final List<Feature> features = [
    Feature(
      color: Colors.red,
      data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LineGraph(
        features: features,
        size: Size(420, 450),
        labelX: ['Nepal', 'Province 1', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
        labelY: ['25%', '45%', '65%', '75%', '85%', '100%'],
        showDescription: true,
        graphColor: Colors.black87,
      ),
    );
  }
}
