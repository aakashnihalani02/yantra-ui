import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/components/AppSignIn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget appBarWidget(context) {
  return AppBar(
    // backgroundColor: Color(0xFFFFC518),
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    title: Image.asset(
      "assets/images/logo.png",
      width: 100,
      height: 50,
      // color: Colors.blue,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppSignIn()),
          );
        },
        icon: Icon(
          FontAwesomeIcons.user,
          color: Colors.black,
        ),
        color: Color(0xFFFFC518),
      ),
    ],
  );
}
