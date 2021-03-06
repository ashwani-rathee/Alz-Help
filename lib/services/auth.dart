import 'package:alzhelp/models/users.dart';
import 'package:alzhelp/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String firebaseError = '';

  Users _usersFromFirebaseUser(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  //auth changes on user stream
  Stream<Users> get user {
    return _auth.authStateChanges().map(_usersFromFirebaseUser);
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _usersFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      var details = {'user': _usersFromFirebaseUser(user), 'error': ''};
      return details;
    } catch (e) {
      print(e.message);
      var details = {'user': null, 'error': e.message};
      return details;
    }
  }

  //register with email pw
  Future registerWithEmailAndPassword(String email, String password, String name) async {
    try {
      UserCredential result =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      var details = {'user': _usersFromFirebaseUser(user), 'error': ''};
      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(name, 0);
      return details;
    } catch (e) {
      print(e.message);
      var details = {'user': null, 'error': e.message};
      return details;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
