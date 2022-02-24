import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart' as webfirebase;
import 'package:firebase/firestore.dart' as webfirestore;
import 'package:flutter/foundation.dart';
import 'package:warranty_watch/helper/utils/user_defs.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:warranty_watch/models/item.dart';
import 'package:warranty_watch/helper/extensions/firebase_extension.dart';

abstract class BaseItemRepository {
  Future<List<Item>> retriveItem({String userId});
  Future<String> createItem({String userId, Item item});
  Future uploadImageToFirebase({File? imagePath});
}

class ItemRepository implements BaseItemRepository {
  @override
  Future<String> createItem({String? userId, Item? item}) async {
    try {
      final docRef = await FirebaseFirestore.instance
          .itemListRef(userId!)
          .add(item!.toJson());
      return docRef.id;
    } on FirebaseException catch (e) {
      return e.message!;
    }
  }

  @override
  Future<List<Item>> retriveItem({String? userId}) async {
    try {
      if (kIsWeb) {
        final snap = await webfirebase.firestore().itemListRef(userId!).get();
        return snap.docs.map((e) => Item.fromJson(e.data())).toList();
      } else {
        final snap =
            await FirebaseFirestore.instance.itemListRef(userId!).get();
        return snap.docs.map((e) => Item.fromJson(e.data() as JSON)).toList();
      }
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future uploadImageToFirebase({File? imagePath}) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(imagePath!);
    return uploadTask.then((TaskSnapshot storageTaskSnapshot) {
      return storageTaskSnapshot.ref.getDownloadURL();
    }, onError: (e) {
      throw Exception(e.toString());
    });
  }
}
