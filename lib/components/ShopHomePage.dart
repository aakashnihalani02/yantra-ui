import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widget/CircularProgress.dart';
import 'package:flutter_ecommerce_app/common_widget/GridTilesCategory.dart';
import 'package:flutter_ecommerce_app/models/ShopModel.dart';
import 'package:flutter_ecommerce_app/utils/Urls.dart';
import 'package:http/http.dart';
import 'package:flutter_ecommerce_app/models/CategoryModel.dart';

ShopModel shopModel;

class ShopHomePage extends StatefulWidget {
  String slug;
  bool isSubList;

  ShopHomePage({Key key, this.slug, this.isSubList = false}) : super(key: key);
  @override
  _ShopHomePageState createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
      return createListView(context, snapshot);
    });
  }
}

Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
  return GridView.count(
    crossAxisCount: 3,
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(
      getEquipments.length,
      (index) {
        return GridTile(
          child: Column(
            children: [
              Container(
                height: 100,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      getEquipments[index].image,
                    ),
                  ),
                ),
              ),
              Text(
                getEquipments[index].title,
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
        );
      },
    ),
  );
}

List<CategoryModel> getEquipments = [
  CategoryModel(
      title: "Backhoe Loader", image: 'assets/images/BackhoeLoaders.jpg'),
  CategoryModel(title: "Excavator", image: 'assets/images/excavator.jpg'),
  CategoryModel(title: "Loader", image: 'assets/images/Loader.png'),
  CategoryModel(title: "Transit Mixer", image: 'assets/images/schwing.jpg'),
  CategoryModel(title: "Crane", image: 'assets/images/crane.png'),
  CategoryModel(
      title: "Backhoe Loader", image: 'assets/images/BackhoeLoaders.jpg'),
];
//https://api.evaly.com.bd/core/public/category/shops/bags-luggage-966bc8aac/?page=1&limit=15
