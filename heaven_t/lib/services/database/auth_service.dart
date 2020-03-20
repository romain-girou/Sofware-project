import 'package:firebase_auth/firebase_auth.dart';
import 'package:heavent/models/user/user.dart';
import 'package:heavent/services/database/database_service.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  User _userFromFireBase (FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // sign in with email and password
  Future signInWithEmailAndPassword (String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      print(_userFromFireBase(user).uid);
      return _userFromFireBase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword (String email, String password, String username, String description, String userImage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with uid
      await DatabaseService(uid: user.uid).setUserData(email, password, username, description, userImage);
      return _userFromFireBase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }  

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFireBase);
  }

}