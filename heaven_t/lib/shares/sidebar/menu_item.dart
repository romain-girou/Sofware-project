import 'package:flutter/material.dart';

//Colors primary and secondary
final secondary_color = Color(0xFF53C999);
final primary_color = Color(0xFF063B6D);

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  
  const MenuItem({Key key, this.icon, this.title, this.onTap}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: secondary_color,
                size: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 26,
                  color: Colors.white,
                ),
              )
            ],
          )
        ),
    );
  }
}
