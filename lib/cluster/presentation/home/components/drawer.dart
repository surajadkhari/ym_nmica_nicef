import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicef/unicef/presentation/home/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Padam Ghimire"),
            accountEmail: Text("padamghimire75@gmail.com"),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: Icon(Icons.filter_list, color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Introduction"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Survery Methodology"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Demography"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Characteristics of househollds and the respondents"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Survive"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Thrive- Reproductive and maternal Health"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Thrive- Child Health,Nutrition and Development"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Learn"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Protected from voilence and exploitation"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Live in a safe and clean environment"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Equitable chance in life"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          ListTile(
            title: Text("Credits"),
            leading: Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new HomeScreen()));
            },
          ),
          Divider(),
          Center(child: Text("Visit us at")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.facebook,
                  color: Colors.blue,
                ),
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  size: 25,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.twitter,
                  size: 25,
                  color: Colors.blue,
                ),
                onPressed: () {
                  canLaunch('http::/twitter.com');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
