import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/CategoryModel.dart';
import 'package:flutter_ecommerce_app/common_widget/CircularProgress.dart';
import 'package:flutter_ecommerce_app/common_widget/GridTilesCategory.dart';
import 'package:flutter_ecommerce_app/utils/Urls.dart';
import 'package:http/http.dart';

List<CategoryModel> categories;

class CategoryPage extends StatefulWidget {
  String slug;
  bool isSubList;

  CategoryPage({Key key, this.slug, this.isSubList = false}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
      return createListView(context);
    });
  }
}

Widget createListView(BuildContext context) {
  return GridView.count(
    crossAxisCount: 3,
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(
      getCategory.length,
      (index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridTile(
              child: Image.asset(
                getCategory[index].image,
              ),
              footer: Text(
                getCategory[index].title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.center,
              ),
              // Column(
              //   children: [
              //     Container(
              //       height: 100,
              //       child: Card(
              //         elevation: 2,
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Image.asset(
              //             getCategory[index].image,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Text(
              //       getCategory[index].title,
              //       style: GoogleFonts.openSans(
              //         textStyle: const TextStyle(
              //           color: Colors.black,
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ],
              // ),
            ),
          ),
        );
        // );
      },
    ),
  );
}

List<CategoryModel> getCategory = [
  CategoryModel(
    image: 'assets/images/category.png',
    title: "Undercarriage",
  ),
  CategoryModel(
    image: "assets/images/category2.png",
    title: "Filters",
  ),
  CategoryModel(
    image: 'assets/images/category3.jpg',
    title: 'Toothpoint',
  ),
  CategoryModel(
    image: 'assets/images/category4.png',
    title: 'Hydraulic Pumps',
  ),
  CategoryModel(
    image: 'assets/images/category5.png',
    title: 'Engine Parts',
  ),
  CategoryModel(
    image: 'assets/images/category6.jpg',
    title: 'Rockbreakers',
  ),
];

// https://api.evaly.com.bd/core/public/categories/?parent=bags-luggage-966bc8aac     sub cate by slug
