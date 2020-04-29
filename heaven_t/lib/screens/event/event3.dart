import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:heavent/shares/sidebar/bloc_navigation/bloc_navigation.dart';
import 'event_class.dart';

eventClass myEvent = new eventClass("End of semester", 2020, "Wednesday", 22, 5 , "10:00 pm", "2:00 pm", "Karma, Kauppatori 3", "60100 Seinäjoki, Finland", 12, "Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi.");

class EventPage3 extends StatefulWidget with NavigationStates {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage3> {
  final secondaryColor = Color(0xFF53C999);
  final primaryColor = Color(0xFF063B6D);

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
                  image: AssetImage("assets/images/landscape_3.png"),
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
                    Text(
                      myEvent.name,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.0),
                    //TODO_here the listTile for the basic info: date, location, price with their logo
                    //TODO_This one for the Date
                    //TODO_So we want the row because all the info in line with the icon first
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                            child: Icon(Icons.event_note,
                                color: primaryColor, size: 20),
                            radius: 20,
                            backgroundColor: secondaryColor.withOpacity(0.25)),
                        //TODO_here we want date and time in column but in the same lin as the icon
                        Container(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                myEvent.dateFinal,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 2.5),
                              Text(
                                myEvent.time,
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),

                    SizedBox(height: 12),
                    //TODO_This one for the Location
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                            child: Icon(Icons.explore,
                                color: primaryColor, size: 20),
                            radius: 20,
                            backgroundColor: secondaryColor.withOpacity(0.25)),
                        //here we want date and time in column but in the same lin as the icon
                        Container(
                            child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                myEvent.location,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 2.5),
                              Text(
                                myEvent.adress,
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                    SizedBox(height: 12),
                    //TODO_This one for the Price
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                            child: Icon(Icons.euro_symbol,
                                color: primaryColor, size: 20),
                            radius: 20,
                            backgroundColor: secondaryColor.withOpacity(0.25)),
                        //here we want date and time in column but in the same lin as the icon
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              myEvent.price.toString() + " €",
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
                    //TODO_Here we want the container for the description with "about" first and then the description all that wrap inside a Column
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
                            myEvent.description,
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


