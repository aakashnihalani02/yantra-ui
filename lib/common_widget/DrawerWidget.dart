import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/main.dart';
import 'package:flutter_ecommerce_app/screens/WishListScreen.dart';
import 'package:flutter_ecommerce_app/components/AppSignIn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createDrawerHeader(),
            _createDrawerItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    )),
            _createDrawerItem(
              icon: FontAwesomeIcons.user,
              text: 'Sign In',
              onTap: () {},
            ),
            _createDrawerItem(
              icon: Icons.favorite_border,
              text: 'Wish List',
              onTap: () {},
            ),
            _createDrawerItem(
              icon: Icons.call,
              text: 'Contact Us',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget _createDrawerHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 15,
            right: 20,
            bottom: 50,
          ),
          child: Image.asset(
            'assets/images/logo.png',
            width: 250,
            height: 250,
          ),
        ),
        Positioned(
          bottom: 12.0,
          left: 16.0,
          child: Text(
            "One Stop Marketplace for Heavy Equipment",
            style: TextStyle(
                color: Color(0xFF0D4A61),
                fontSize: 10.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          color: Color(0xFF0D4A61),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFF0D4A61),
            ),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
