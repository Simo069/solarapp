import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solarapp/Models/UserModel.dart';


import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
class UserProvider extends ChangeNotifier{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel? _user;
  UserModel? get user => _user;
  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }
  UserModel? getUser() {
    return _user;
  }
  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
  void logout() {
    _user = null;
    notifyListeners();
  }
  void updateUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
  Future<void> updateUserProfile(UserModel updatedUser) async {
  // Update in Firestore/Firebase/your backend
  await FirebaseFirestore.instance
      .collection('users')
      .doc(updatedUser.uid)
      .update(updatedUser.toMap());

  // Update local user data
  _user = updatedUser;
  notifyListeners();
}
}