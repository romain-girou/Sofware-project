import 'package:flutter/material.dart';
import 'package:heavent/models/user/user.dart';
import 'package:heavent/screens/wrapper.dart';
import 'package:heavent/services/database/auth_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: MaterialApp(
        title: 'heavent',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
      ),
    );
  }
}