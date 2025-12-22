import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout/model/user_model.dart';

class UserProvider extends ChangeNotifier{
  final __firestore = updateUser();
  final _storage = userData();
  UserModel? user;
  bool isLoading = false;
  
  Future<void> loadUser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    user = await __firestore.getUser(uid);
    notifyListeners();
  }

  Future<void> updateProfile({
    required String firstName,
    File? image,
  }) async {
    isLoading = true;
    notifyListeners();

    String? imageUrl = user!.photoUrl;

    if (image != null) {
      imageUrl = await _storage.uploadProfileImage(user!.id, image);
    }

    user = UserModel(
      id: user!.id, 
      firstName: firstName, 
      email: user!.email,
      photoUrl: imageUrl
    );

    await __firestore.updateUserData(user!);
    isLoading = false;
    notifyListeners();
  }
}