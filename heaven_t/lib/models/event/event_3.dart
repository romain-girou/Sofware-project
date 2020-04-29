import 'package:flutter/material.dart';
import 'package:heavent/screens/event/event2.dart';
import 'package:heavent/screens/event/event3.dart';
import 'package:heavent/screens/event/event_class.dart';


final secondaryColor = Color(0xFF53C999);
final primaryColor = Color(0xFF063B6D);

class eventPage_3 extends StatefulWidget {
  @override
  _eventPage_3State createState() => _eventPage_3State();
}

eventClass myEvent = new eventClass(
    "End of semester", 2020, "Wednesday", 22, 5 , "10:00 pm", "2:00 pm", "Karma, Kauppatori 3","60100 Seinäjoki, Finland",12,"Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi Lorem ipsum dolor sit amet,  etur adipiscing elit, sed do eiusmod tempor incidi.");

class _eventPage_3State extends State<eventPage_3> {
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
                    image: AssetImage("assets/images/landscape_3.png"),
                    alignment: Alignment.bottomCenter,
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
                    SizedBox(width: 60),
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
            builder: (context) => EventPage3()
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