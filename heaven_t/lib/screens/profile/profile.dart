import 'package:flutter/material.dart';
import 'package:heavent/models/event/event_1.dart';
import 'package:heavent/models/event/event_2.dart';
import 'package:heavent/models/event/event_4.dart';
import 'package:heavent/models/event/event_5.dart';
import 'package:heavent/shares/sidebar/bloc_navigation/bloc_navigation.dart';
import 'package:heavent/screens/event/event_class.dart';

final secondaryColor = Color(0xFF53C999);
final primaryColor = Color(0xFF063B6D);
eventClass myEvent = new eventClass("Puskantie BBQ",2021,"Sat",03,8,"11:30 am","3:00 pm","Puskantie 38","60100 Seinäjoki, Finland",50,"Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi.");

class ProfilePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 30,
                left: 40,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 175,
                    //color: Colors.black,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 80,
                            left: 60,
                            child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.95),
                                  shape: BoxShape.circle,
                                ))),
                        Positioned(
                            top: 40,
                            left: 90,
                            child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: secondaryColor.withOpacity(0.95),
                                  shape: BoxShape.circle,
                                ))),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 25,
                          ),
                          child: Container(
                            width: 125,
                            height: 125,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/portrait.png"),
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.lightBlue[50],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Benasse Mickaël",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: "Cairo",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Apartement",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: "Cairo",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod consectetur adipiscing elit consectetu",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: "Cairo",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Text(
                "My event",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
            child: ListView(
              children: [
                eventPage_1(),
                eventPage_5(),
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}

homeEvent(int day, String month, String time, String name) {
  return Column(
    children: <Widget>[
      Container(
        height: 175,
        //color:Colors.black,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/event_im_example.jpg"),
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
              right: 30,
              top: 110,
              child: Container(
                height: 65,
                //* Do not need this but we'll see:  width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    //! See for the color of the background opacity or not
                    color: secondaryColor.withOpacity(0.95),
                    //color:secondary_color,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        children: <Widget>[
                          Text(
                            myEvent.day.toString(),
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            myEvent.month.toString(),
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                    VerticalDivider(
                      width: 40,
                      color: primaryColor,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            myEvent.name,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            myEvent.time,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 14,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 90),
                    Icon(
                      Icons.favorite_border,
                      color: primaryColor,
                      size: 25,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}

