import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicef/application/cluster_list/cluster_list_bloc.dart';

import 'package:unicef/presentation/home/components/card_componet.dart';
import 'package:unicef/presentation/home/components/search.dart';

class HomeScreenWidget extends StatefulWidget {
  final String? id;

  const HomeScreenWidget({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late ClusterListBloc clutserListBloc;

  @override
  void initState() {
    clutserListBloc = BlocProvider.of<ClusterListBloc>(context);
    clutserListBloc.add(ClusterListEvent.watchAllStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchComponent(),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Choose Indicator"),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: BlocBuilder<ClusterListBloc, ClusterListState>(
              builder: (context, state) {
                if (state is Initial) {
                  return CircularProgressIndicator();
                } else if (state is DataTransferInProgress) {
                  return CircularProgressIndicator();
                } else if (state is LoadSuccess) {
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                        CardComponent(title: "bdjsb", press: () {}, id: "1")
                      ],
                    ),
                  );
                }
                return Text("Something went wrong!");
              },
            ),
          )
        ],
      ),
    );
  }
}
