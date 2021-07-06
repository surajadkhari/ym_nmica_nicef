import 'package:flutter/material.dart';
import 'package:unicef/cluster/presentation/filter/components/filter_widget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FilterWidget(),
    );
  }
}
