import 'package:flutter/material.dart';
import 'package:heavent/shares/sidebar/bloc_navigation/bloc_navigation.dart';
import 'dart:ui';

final secondary_color = Color(0xFF53C999);
final primary_color = Color(0xFF063B6D);

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
          Padding(
            padding: EdgeInsets.only(
              top: 30,
              left: 0,
            ),
            child: Text(
              "Title of the page",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                homeEvent(25, "May", "12:00 am - 4:00 pm", "Puskantie BBQ"),
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
                    color: secondary_color.withOpacity(0.95),
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
                            day.toString(),
                            style: TextStyle(
                              color: primary_color,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            month,
                            style: TextStyle(
                              color: primary_color,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                    VerticalDivider(
                      width: 40,
                      color: primary_color,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                              color: primary_color,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              color: primary_color,
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
                      color: primary_color,
                      size: 25,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20,),
    ],
  );
}
