import 'package:flutter/material.dart';
import 'package:heavent/screens/event/event2.dart';
import 'package:heavent/screens/event/event_class.dart';


final secondaryColor = Color(0xFF53C999);
final primaryColor = Color(0xFF063B6D);

class eventPage_2 extends StatefulWidget {
  @override
  _eventPage_2State createState() => _eventPage_2State();
}

eventClass myEvent = new eventClass(
    "Hiking in the forest",
    2020,
    "Sat",
    10,
    5,
    "9:00 am",
    "6:00 pm",
    "Kyrkösjärven",
    "60100 Seinäjoki, Finland",
    10,
    "Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi.");

class _eventPage_2State extends State<eventPage_2> {
  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget>[
      FlatButton(
        child: Container(
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
                    image: AssetImage("assets/images/landscape_2.jpg"),
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
                    SizedBox(width: 35),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryColor,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),),
        onPressed:() {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => EventPage2()
            ));
        }
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
  }
}