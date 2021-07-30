import 'package:flutter/material.dart';
import 'package:unicef/unicef/models/notification_model.dart';
import 'package:unicef/unicef/services/notification_service.dart';

class NotificationScreenWidget extends StatefulWidget {
  const NotificationScreenWidget({Key? key}) : super(key: key);

  @override
  _NotificationScreenWidgetState createState() =>
      _NotificationScreenWidgetState();
}

class _NotificationScreenWidgetState extends State<NotificationScreenWidget> {
  Future<List<NotificationModel>>? futureData;
  NoificationService _noificationService = NoificationService();
  @override
  void initState() {
    super.initState();
    futureData = _noificationService.getAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 2),
          Expanded(
            child: FutureBuilder<List<NotificationModel>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<NotificationModel>? data = snapshot.data;
                  return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleChildScrollView(
                        child: ExpansionPanelList(
                          children: [
                            ExpansionPanel(
                              canTapOnHeader: true,
                              isExpanded: true,
                              headerBuilder: (context, isOpen) {
                                return ListTile(
                                    title:
                                        Text(data[index].notificationTitle!));
                              },
                              body: ListTile(
                                title: Text(data[index].notificationText!),
                              ),
                            )
                          ],
                          expansionCallback: (context, isOpen) {
                            setState(() {
                              data[index].isOpen = false;
                            });
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
