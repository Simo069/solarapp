import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solarapp/Models/UserModel.dart';


class UserProvider extends ChangeNotifier{
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

}