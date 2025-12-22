import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

  factory UserModel.fromMap(Map<String, dynamic> data, String id) {
    return UserModel(
      id: id, 
      firstName: data['firstname'], 
      email: data['email'],
      photoUrl: data['[photoUrl]']
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

class updateUser {
  final _db = FirebaseFirestore.instance;

  Future<UserModel> getUser(String id) async {
    final doc = await _db.collection('users').doc(id).get();
    return UserModel.fromMap(doc.data()!, id);
  }

  Future<void> updateUserData(UserModel user) async {
    await _db.collection('users').doc(user.id).update(user.toMap());
  }
}

class userData {
  final _storage = FirebaseStorage.instance;

  Future<String> uploadProfileImage(String id, File file) async {
    final ref = _storage.ref('profile_images/$id.jpg');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }
}