import 'package:flutter/material.dart';
import 'package:heavent/services/database/auth_service.dart';
import 'package:heavent/shares/constant.dart';
import 'package:heavent/shares/loading/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register ({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String username = '';
  String description = '';
  String userImage = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
        title: Text('Register to Share'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(
              Icons.person, 
              color: Colors.white,
            ), 
            label: Text(
              'Sign in',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        child: Form(
          key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Enter a username'),
                  validator: (val) {
                    return val.length < 2 ? 'Enter a password +2 chars long' : null; // username unique
                  },
                  onChanged: (val) {
                    setState(() {
                      username = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Enter an email'),
                  validator: (val) {
                    return val.isEmpty ? 'Enter an email' : null;
                  },
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(hintText: 'Enter a password'),
                  validator: (val) {
                    return val.length < 6 ? 'Enter a password +6 chars long' : null;
                  },
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password, username, description, userImage);
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Enter a valid email please.';
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ), 
          ),
      ),
    );
  }
}