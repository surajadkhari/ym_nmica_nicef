import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:unicef/unicef/components/drawer.dart';
import 'package:unicef/unicef/models/notification_model.dart';
import 'package:unicef/unicef/services/notification_service.dart';

class NotificationScreenWidget extends StatefulWidget {
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
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 1170,
              child: FutureBuilder<List<NotificationModel>>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<NotificationModel>? data = snapshot.data;
                      return ListView.builder(
                          itemCount: data!.length,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ExpansionTileCard(
                                baseColor: Colors.white,
                                elevation: 0,
                                expandedColor: Colors.white,
                                title: Text(
                                  data[index].notificationTitle!,
                                  style: TextStyle(color: Colors.black),
                                ),
                                children: <Widget>[
                                  Divider(
                                    thickness: 1.0,
                                    height: 10.0,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        data[index].notificationText!,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );

                            // return Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     SizedBox(),
                            //     Container(
                            //       decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         borderRadius: BorderRadius.circular(5),
                            //       ),
                            //       child: Column(
                            //         children: [
                            //           SizedBox(height: 12),
                            //           Row(
                            //             children: [
                            //               Column(
                            //                 children: [
                            //                   Text("Date"),
                            //                   Container(
                            //                       child: Text(data[index]
                            //                           .notificationDate!)),
                            //                 ],
                            //               ),
                            //               Column(
                            //                 children: [
                            //                   Text(
                            //                     data[index].notificationTitle!,
                            //                     style: TextStyle(
                            //                         fontWeight: FontWeight.bold),
                            //                   ),
                            //                   Padding(
                            //                     padding:
                            //                         const EdgeInsets.all(8.0),
                            //                     child: Flexible(
                            //                       child: Text(
                            //                         data[index].notificationText!,
                            //                         maxLines: 900,
                            //                         softWrap: false,
                            //                         overflow: TextOverflow.clip,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //               Divider(
                            //                 height: 2,
                            //               ),
                            //             ],
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ),
        ),
      ),
      drawer: DrawerNavigation(),
    );
  }
}
