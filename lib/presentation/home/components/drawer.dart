import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../home_screen.dart';

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
            accountName: const Text("Padam Ghimire"),
            accountEmail: const Text("padamghimire75@gmail.com"),
            currentAccountPicture: GestureDetector(
              child: const CircleAvatar(
                backgroundColor: Colors.black54,
                child: Icon(Icons.filter_list, color: Colors.white),
              ),
            ),
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: const Text("Home"),
            leading: const Icon(
              Icons.home,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text("Introduction"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text("Survery Methodology"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text("Demography"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text(
                "Characteristics of househollds and the respondents"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text("Survive"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text("Thrive- Reproductive and maternal Health"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text("Thrive- Child Health,Nutrition and Development"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text("Learn"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text("Protected from voilence and exploitation"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text("Live in a safe and clean environment"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text("Equitable chance in life"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text("Credits"),
            leading: const Icon(
              FontAwesomeIcons.greaterThan,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          const Divider(),
          const Center(child: Text("Visit us at")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
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
                onPressed: () {},
              ),
              IconButton(
                icon: const FaIcon(
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
