import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService ({this.uid});
  
  // collection reference
  final CollectionReference user = Firestore.instance.collection('user');

  // Set user data into Cloud fireBase
  Future setUserData (String email, String password, String username, String description, String userImage) async {
    return await user.document(uid).setData({
      'email': email,
      'password': password,
      'username': username,
      'description': description,
      'userImage': userImage
    });
  }
}