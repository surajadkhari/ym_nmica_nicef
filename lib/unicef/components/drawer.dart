import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicef/common/utils/size_configs.dart';
import 'package:unicef/unicef/models/clusters.dart';
import 'package:unicef/unicef/screens/credit_screen.dart';
import 'package:unicef/unicef/screens/indicator_screen.dart';
import 'package:unicef/unicef/screens/information_screen.dart';
import 'package:unicef/unicef/screens/introduction_screen.dart';
// import 'package:unicef/unicef/screens/introduction_screen.dart';
import 'package:unicef/unicef/screens/map_screen.dart';
import 'package:unicef/unicef/screens/sync_screen.dart';
import 'package:unicef/unicef/services/cluster_service.dart';
import 'package:unicef/unicef/services/credit_service.dart';
import 'package:unicef/unicef/services/infomation_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:unicef/unicef/screens/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  final String? id;

  const DrawerNavigation({Key? key, this.id}) : super(key: key);

  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  ClusterService _clusterService = ClusterService();
  InfomationService _informationService = InfomationService();
  CreditService _creditService = CreditService();

  void initState() {
    super.initState();

    getAllClusters();
  }

  getIntroduction() async {
    var data = await _informationService.getIntroduction();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InfomationScreen(
          title: "Introduction",
          information: data,
        ),
      ),
    );
  }

  getCredits() async {
    var data = await _creditService.getCredits();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreditScreen(
          title: "Credits",
          information: data,
        ),
      ),
    );
  }

  getSurvey() async {
    var data = await _informationService.getSurvey();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InfomationScreen(
          title: "Survey Methodology",
          information: data,
        ),
      ),
    );
  }

  getDemography() async {
    var data = await _informationService.getDemography();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InfomationScreen(
          title: "Demography",
          information: data,
        ),
      ),
    );
  }

  var _clusterList = [];

  getAllClusters() async {
    var clusters = await _clusterService.getClusters();

    clusters.forEach((data) {
      var model = Cluster();
      model.id = data['id'];
      model.name = data['name'];
      model.image = data['image'];
      setState(() {
        _clusterList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // UserAccountsDrawerHeader(
          //   accountName: const Text(
          //     "NMICS",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   accountEmail: Row(
          //     children: [
          //       Text("Sycn Data"),
          //       IconButton(
          //           onPressed: () {
          //             Navigator.pushNamedAndRemoveUntil(
          //                 context, SyncScreen.screenId, (route) => false);
          //           },
          //           icon: Icon(
          //             Icons.refresh,
          //             color: Colors.white,
          //           ))
          //     ],
          //   ),
          //   currentAccountPicture: GestureDetector(
          //     child: CircleAvatar(
          //       backgroundColor: Colors.white,
          //       child: Image.asset(
          //         'assets/images/mic_logo.png',
          //         height: 100.0,
          //       ),
          //     ),
          //   ),
          //   decoration: const BoxDecoration(color: Colors.blue),
          // ),
          Container(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow[400],
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("N",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                  "M",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "I",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("C",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text("S",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            Text("2020-21",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 200,
                          child: Image.asset(
                            'assets/images/new.png',
                            height: 200.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            leading: const Icon(
              FontAwesomeIcons.home,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.screenId, (route) => false);
            },
          ),
          ListTile(
            title: const Text("Introduction"),
            leading: const Icon(
              FontAwesomeIcons.info,
              color: Colors.blue,
            ),
            onTap: () {
              // Navigator.pushNamedAndRemoveUntil(
              //     context, IntroductionScreen.screenId, (route) => false);
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => IntroductionScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Preference"),
            leading: const Icon(
              FontAwesomeIcons.checkCircle,
              color: Colors.blue,
            ),
            onTap: () async {
              InfomationService _informationService = InfomationService();

              var data = await _informationService.getDescriptions();

              Navigator.pushNamedAndRemoveUntil(
                  context, MapScreen.screenId, (route) => false);
            },
          ),
          // ListTile(
          //   title: const Text("Survey Methodology"),
          //   leading: const Icon(
          //     FontAwesomeIcons.greaterThan,
          //     color: Colors.blue,
          //   ),
          //   onTap: () {
          //     getSurvey();
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   title: const Text("Demography"),
          //   leading: const Icon(
          //     FontAwesomeIcons.greaterThan,
          //     color: Colors.blue,
          //   ),
          //   onTap: () {
          //     getDemography();
          //   },
          // ),
          ExpansionTile(
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            title: Text(
              "Clusters",
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  height: getProportionateScreenHeight(450),
                  child: ListView.builder(
                    itemCount: _clusterList.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(_clusterList[index].name),
                        // leading: const Icon(
                        //   FontAwesomeIcons.greaterThan,
                        //   color: Colors.blue,
                        // ),
                        leading: CachedNetworkImage(
                          imageUrl: _clusterList[index].image,
                          height: 30,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => IndicatorScreen(
                                id: _clusterList[index].id!,
                                name: _clusterList[index].name,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            title: const Text("Credits"),
            leading: const Icon(
              FontAwesomeIcons.copyright,
              color: Colors.blue,
            ),
            onTap: () {
              getCredits();
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          const Center(child: Text("Visit us at")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  await launch('https://www.facebook.com/unicefnepal');
                },
                icon: const Icon(
                  Icons.facebook,
                  color: Colors.blue,
                ),
              ),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.instagram,
                  size: 25,
                  color: Colors.blue,
                ),
                onPressed: () async {
                  await launch('https://www.instagram.com/unicefnepal/');
                },
              ),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.twitter,
                  size: 25,
                  color: Colors.blue,
                ),
                onPressed: () async {
                  await launch('https://twitter.com/unicef_nepal?lang=en');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
