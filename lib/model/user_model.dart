import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final String id;
  final String firstName;
  final String email;
  final String? photoUrl;

  UserModel({
    required this.id,
    required this.firstName,
    required this.email,
    this.photoUrl
  });

  static final userRef = FirebaseFirestore.instance.collection('users');

  Future<void> addWorkout() async {
    await userRef.doc(id).collection('workouts').add(
      {
        'calories': 350,
        'duration': 45,
        'date': Timestamp.now()
      }
    );
  }

  Stream<QuerySnapshot> getUserWorkoutsStream()  {
    return userRef.doc(id).collection('workouts').orderBy('date', descending: true).snapshots();
  }

  factory UserModel.fromMap(Map<String, dynamic> data, String id) {
    return UserModel(
      id: id, 
      firstName: data['firstname'] ?? '', 
      email: data['email'] ?? '',
      photoUrl: data['photoUrl']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstname': firstName,
      'photoUrl': photoUrl
    };
  }
}

class UpdateUser {
  final _db = FirebaseFirestore.instance;

  // Future<UserModel> getUser(String id) async {
  //   final doc = await _db.collection('users').doc(id).get();
  //   return UserModel.fromMap(doc.data()!, id);
  // }

  Future<void> updateUserData(UserModel user) async {
    try {
      await _db.collection('users')
      .doc(user.id).set(user.toMap(), 
      SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error  updating user: $e');
    }
  }

  Future<UserModel?> getUser(String id) async {
    final doc = await _db.collection('users').doc(id).get();

    if (!doc.exists || doc.data() == null) {
      return null;
    }

    return UserModel.fromMap(doc.data()!, id);
  }
}

class UserStorage {
  final _storage = FirebaseStorage.instance;

  Future<String?> uploadProfileImage(String id, File file) async {
    try {
      final ref = _storage.ref('profile_images/$id.jpg');
      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      debugPrint('image upload error: $e');
      return 'Failed';
    }
  }
}


Future<void> createUserIfNotExists(User firebaseUser) async {
  final doc = await FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).get();

  if (!doc.exists) {
    await FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set({
      'email': firebaseUser.email,
      'firstname': '',
      'photoUrl': null,
      'createdAt': Timestamp.now()
    });
  }
}