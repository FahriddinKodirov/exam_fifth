import 'package:firebase_app/data/models/dio_model/my_response/my_response.dart';
import 'package:firebase_app/data/models/dio_model/users_model.dart';
import 'package:firebase_app/data/repositories/dio_repositories/users_repo.dart';
import 'package:flutter/cupertino.dart';

class UsersViewModel extends ChangeNotifier {
  UsersViewModel({required this.usersRepo}){
    fetchUser();
  }

  UsersRepo usersRepo;

  String errorUi = "";

  List<UsersModel>? usersModel = [];

  fetchUser() async {
    MyResponse myResponse = await usersRepo.getAllUsers();
    if (myResponse.error.isEmpty) {
      usersModel = myResponse.data;
    } else {
      errorUi = myResponse.error;
    }
    notifyListeners();
  }
}