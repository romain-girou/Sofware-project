import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:heavent/shares/sidebar/bloc_navigation/bloc_navigation.dart';

class EventPage extends StatefulWidget with NavigationStates {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final secondary_color = Color(0xFF53C999);
  final primary_color = Color(0xFF063B6D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(children: [
          //uses of stack to have this depth effect with the picture in backgroudn and the information fo the event

          Stack(children: [
            //we will have here in the background picture of the event
            Container(
              height: MediaQuery.of(context).size.height-24,//! change this value to 0 if we resolve the issue with the alignment under the status bar
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/event_im_example.jpg"),
                  //! See for the alignement under the status bar instead of below
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            //Here we have the little superposition of the rounded container
            Positioned(
                top: 230.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width)),
            //Here we will have all the information for the event: name, location, decription etc.
            Positioned(
                top: 260.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Puskantie BBQ",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.0),
                    //TODO here the listTile for the basic info: date, location, price with their logo
                    //TODO This one for the Date
                    //TODO So we want the row because all the info in line with the icon first
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                            child: Icon(Icons.event_note,
                                color: primary_color, size: 20),
                            radius: 20,
                            backgroundColor: secondary_color.withOpacity(0.25)),
                        //TODO here we want date and time in column but in the same lin as the icon
                        Container(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Sat, May 25, 2019",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 2.5),
                              Text(
                                "12:00 am - 4:00 pm",
                                style: TextStyle(
                                  color: primary_color,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),

                    SizedBox(height: 12),
                    //TODO This one for the Location
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                            child: Icon(Icons.explore,
                                color: primary_color, size: 20),
                            radius: 20,
                            backgroundColor: secondary_color.withOpacity(0.25)),
                        //here we want date and time in column but in the same lin as the icon
                        Container(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Puskantie 38",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 2.5),
                              Text(
                                "60100 Seinäjoki, Finland",
                                style: TextStyle(
                                  color: primary_color,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                    SizedBox(height: 12),
                    //TODO This one for the Price
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                            child: Icon(Icons.euro_symbol,
                                color: primary_color, size: 20),
                            radius: 20,
                            backgroundColor: secondary_color.withOpacity(0.25)),
                        //here we want date and time in column but in the same lin as the icon
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "60 €",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    //TODO Here we want the container for the description with "about" first and then the description all that wrap inside a Column
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "About",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 12.5),
                          Text(
                            "Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi.",
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.25,
                              height: 1.5,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
          ])
        ]),
      ),
    );
  }
}
