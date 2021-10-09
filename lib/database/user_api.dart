import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:volt_arena_app/models/app_user.dart';
import 'package:volt_arena_app/widgets/custom_toast.dart';

class UserAPI {
  static const String _collection = 'users';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  // functions
  Future<DocumentSnapshot<Map<String, dynamic>>> getInfo(
      {required String uid}) async {
    return _instance.collection(_collection).doc(uid).get();
  }

  Future<bool> addUser(AppUser appUser) async {
    await _instance
        .collection(_collection)
        .doc(appUser.id)
        .set(appUser.toMap())
        .catchError((Object e) {
      CustomToast.successToast(message: e.toString());
      return false;
    });
    return true;
  }

  Future<String> uploadImage(File? file) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('usersImages')
        .child('_fullName! ' + '.jpg');
    await ref.putFile(file!);
    String url = await ref.getDownloadURL();
    return url;
  }
}
