import 'package:flutter/material.dart';
import 'package:heavent/screens/event/event_class.dart';
import 'package:heavent/shares/sidebar/bloc_navigation/bloc_navigation.dart';
import 'dart:ui';
import 'dart:math' as math;

eventClass myEvent = new eventClass(
    "Puskantie BBQ",
    2021,
    "Sat",
    03,
    8,
    "11:30 am",
    "3:00 pm",
    "Puskantie 38",
    "60100 Seinäjoki, Finland",
    50,
    "Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi.");
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
      //*!backgroundColor: primary_color.withOpacity(0.8),
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
              SizedBox(width: 80,),
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
                homeEvent(myEvent.day, myEvent.month.toString(),
                    myEvent.dateFinal, myEvent.name),
                homeEvent(22, "May", "12:00 am - 4:00 pm", "End of school"),
                homeEvent(22, "May", "12:00 am - 4:00 pm", "End of school"),
                homeEvent(20, "June", "8:00 pm - 12:00 pm", "Another title"),
              ],
            ),
          )
        ],
      )),
    );
  }
}

//TODOAdd the picture to the argument of the function + icon click to redirection to the correspondant event + click heart it changed of state => heart filled
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
