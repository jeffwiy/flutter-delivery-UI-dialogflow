import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_delivery_UI_dialogflow/screens/sides.dart';
import 'package:flutter_delivery_UI_dialogflow/screens/trendingPizza.dart';
import 'package:flutter_delivery_UI_dialogflow/util/sides.dart';
import 'package:flutter_delivery_UI_dialogflow/util/pizzas.dart';
import 'package:flutter_delivery_UI_dialogflow/widgets/category_item.dart';
import 'package:flutter_delivery_UI_dialogflow/widgets/search_card.dart';
import 'package:flutter_delivery_UI_dialogflow/widgets/slide_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            buildRestaurantRow(' Pizza', context),
            SizedBox(height: 10.0),
            buildRestaurantList(context),
            SizedBox(height: 10.0),
            buildCategoryRow('Sides', context),
            SizedBox(height: 10.0),
            buildCategoryList(context),
            SizedBox(height: 20.0),
            //buildCategoryRow('Friends', context),
            //SizedBox(height: 10.0),
            //buildFriendsList(),
            //SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  buildRestaurantRow(String restaurant, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$restaurant",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "See all (6)",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Trending();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  buildCategoryRow(String category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$category",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "See all (6)",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Categories();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  buildSearchBar(BuildContext context) {
    return PreferredSize(
      child: Padding(
        padding: EdgeInsets.only(
          top: Platform.isAndroid ? 30.0 : 50.0,
          left: 10.0,
          right: 10.0,
        ),
        child: SearchCard(),
      ),
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        60.0,
      ),
    );
  }

  buildCategoryList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: sides == null ? 0 : sides.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = sides[index];

          return CategoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  buildRestaurantList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: pizzas == null ? 0 : pizzas.length,
        itemBuilder: (BuildContext context, int index) {
          Map restaurant = pizzas[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SlideItem(
              img: restaurant["img"],
              title: restaurant["title"],
              address: restaurant["address"],
              rating: restaurant["rating"],
            ),
          );
        },
      ),
    );
  }
}
