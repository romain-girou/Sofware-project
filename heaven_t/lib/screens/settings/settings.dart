import 'package:flutter/material.dart';
import 'package:heavent/shares/sidebar/bloc_navigation/bloc_navigation.dart';

class SettingPage extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "SettingPage", 
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      )
    );
  }
}