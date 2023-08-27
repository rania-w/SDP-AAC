import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('test');

  Future updateUserData(String test) async {
    return collectionReference.doc(uid).set({"test": test});
  }
}
