import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart' as webfirebase;
import 'package:firebase/firestore.dart' as webfirestore;
import 'package:firebase_core/firebase_core.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference itemListRef(String userId) =>
      collection('lists').doc(userId).collection('ItemList');
}

extension FirebaseFirestoreWeb on webfirestore.Firestore {
  webfirestore.CollectionReference itemListRef(String userId) => webfirebase
      .firestore()
      .collection('lists')
      .doc(userId)
      .collection('ItemList');
}
