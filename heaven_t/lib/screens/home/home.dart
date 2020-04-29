import 'package:flutter/material.dart';
import 'package:heavent/models/event/event_1.dart';
import 'package:heavent/models/event/event_2.dart';
import 'package:heavent/models/event/event_3.dart';
import 'package:heavent/models/event/event_4.dart';
import 'package:heavent/models/event/event_5.dart';
import 'package:heavent/shares/sidebar/bloc_navigation/bloc_navigation.dart';
import 'dart:ui';
import 'dart:math' as math;


final secondaryColor = Color(0xFF53C999);
final primaryColor = Color(0xFF063B6D);

class HomePage extends StatefulWidget with NavigationStates {
  @override
  _HomePageState createState() => _HomePageState();
}

//TODO_Add the search icon on top next to the title in a row
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background colors ? add one or not
      //backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  left: 50,
                ),
                child: Text(
                  "All events",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 80,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  right: 30,
                ),
                //* into transform widget because we want the magnifying glass in the other side (in mirror effect).
                //TODO_We want that when the icon is press: a classic search bar.
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                eventPage_1(),
                eventPage_2(),
                eventPage_3(),
                eventPage_4(),
                eventPage_5(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
