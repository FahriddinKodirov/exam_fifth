
import 'package:firebase_app/data/api_service/api_service.dart';
import 'package:firebase_app/data/models/dio_model/my_response/my_response.dart';

class UsersRepo{
  UsersRepo( {required this.apiService});
  ApiService apiService;

  Future<MyResponse> getAllUsers()=>apiService.getAllUsers();
}