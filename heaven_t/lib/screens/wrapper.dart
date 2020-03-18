import 'package:flutter/material.dart';
import 'package:heavent/models/user/user.dart';
import 'package:heavent/screens/authenticate/authenticate.dart';
import 'package:heavent/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}