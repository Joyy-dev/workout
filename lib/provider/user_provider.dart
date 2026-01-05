import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout/model/user_model.dart';

class UserProvider with ChangeNotifier{
  final __firestore = updateUser();
  final _storage = userStorage();
  UserModel? user;
  bool isLoading = false;
  
  Future<void> loadUser(String uid) async {
    // final uid = FirebaseAuth.instance.currentUser!.uid;
    // user = await __firestore.getUser(uid);
    final result = await __firestore.getUser(uid);

    if (result == null) {
      debugPrint('Firestore User Not Found');
      return;
    }

    user = result;
    notifyListeners();
  }

  Future<void> updateProfile({
    required String firstName,
    File? image,
  }) async {
    if (user == null) {
      throw Exception('No user loaded');
    }

    isLoading = true;
    notifyListeners();

    try {
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
    } finally {
      isLoading = false;
      notifyListeners();
    }
  } 
}