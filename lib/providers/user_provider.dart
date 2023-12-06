import 'package:flutter/material.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:provider/provider.dart';
class UserProvider extends ChangeNotifier{
  User? _user;
  final _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async{
     User user = await AuthMethods().getUserDetails();
     _user = user;
     notifyListeners();
  } 
}