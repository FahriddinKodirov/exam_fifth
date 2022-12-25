import 'package:dio/dio.dart';
import 'package:firebase_app/data/api_service/api_client.dart';
import 'package:firebase_app/data/models/dio_model/my_response/my_response.dart';
import 'package:firebase_app/data/models/dio_model/users_model.dart';


class ApiService  extends ApiClient{

   Future<MyResponse> getAllUsers() async {

      MyResponse myResponse = MyResponse(error: '');

    try{
      Response response = await dio.get("${dio.options.baseUrl}/users");
      if(response.statusCode == 200){
        myResponse.data = (response.data as List?)?.map((e) => UsersModel.fromJson(e)).toList()??[];
      }
    } catch (err){
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}