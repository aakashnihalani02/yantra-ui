import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widget/CircularProgress.dart';
import 'package:flutter_ecommerce_app/common_widget/GridTilesCategory.dart';
import 'package:flutter_ecommerce_app/utils/Urls.dart';
import 'package:http/http.dart';

import '../models/BrandModel.dart';

BrandModel brandModel;

class BrandHomePage extends StatefulWidget {
  String slug;
  bool isSubList;

  BrandHomePage({Key key, this.slug, this.isSubList = false}) : super(key: key);
  @override
  _BrandHomePageState createState() => _BrandHomePageState();
}

class _BrandHomePageState extends State<BrandHomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // future: getCategoryList(widget.slug, widget.isSubList),
        builder: (context, AsyncSnapshot snapshot) {
      // switch (snapshot.connectionState) {
      //   case ConnectionState.none:
      //   case ConnectionState.waiting:
      //     return CircularProgress();
      //   default:
      //     if (snapshot.hasError)
      //       return Text('Error: ${snapshot.error}');
      //     else
      return createListView(context, snapshot);
    }
        // },
        );
  }
}

Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
  BrandModel values = snapshot.data;
  // List<Results> results = values.results;
  return GridView.count(
    crossAxisCount: 3,
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(getBrand.length, (index) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
        child: GridTile(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      getBrand[index].image,
                      // height: height * 0.09,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                getBrand[index].title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }),
  );
}

List<BrandModel> getBrand = [
  BrandModel(
    title: 'JCB',
    image: 'assets/images/jcb.png',
  ),
  BrandModel(
    title: 'CAT',
    image: 'assets/images/cat.png',
  ),
  BrandModel(
    title: "hitachi",
    image: 'assets/images/hitachi.png',
  ),
  BrandModel(
    title: 'Kawasaki',
    image: 'assets/images/kawasaki.jpg',
  ),
  BrandModel(
    title: 'JCB',
    image: 'assets/images/jcb.png',
  ),
  BrandModel(
    title: 'CAT',
    image: 'assets/images/cat.png',
  ),
];

//https://api.evaly.com.bd/core/public/brands/?limit=20&page=1&category=bags-luggage-966bc8aac
