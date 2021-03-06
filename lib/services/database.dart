import 'package:alzhelp/models/alz.dart';
import 'package:alzhelp/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference alzCollection = FirebaseFirestore.instance.collection('alz');

  Future updateUserData(String name, int score) async {
    return await alzCollection.doc(uid).set({'name': name, 'score': score});
  }

  //alz list from snapshot
  List<Alz> _alzListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Alz(name: doc.data()['name'] ?? '', score: doc.data()['score'] ?? 0);
    }).toList();
  }

  //get alz stream

  Stream<List<Alz>> get alz {
    return alzCollection.snapshots().map(_alzListFromSnapshot);
  }

  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(uid: uid, name: snapshot.data()['name'], score: snapshot.data()['score']);
  }

  // get user data stream
  Stream<UserData> get userData {
    return alzCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
