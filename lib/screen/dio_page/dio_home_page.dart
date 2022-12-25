import 'package:firebase_app/view_model/dio_view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DioHomePage extends StatefulWidget {
  const DioHomePage({super.key});

  @override
  State<DioHomePage> createState() => _DioHomePageState();
}

class _DioHomePageState extends State<DioHomePage> {
  @override
  Widget build(BuildContext context) {
    var field = context.read<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(

        
        title: Text("Dio"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: field.usersModel!.length,
          itemBuilder: (context, index) {
          if(field.usersModel == null){
            return Center(child: CircularProgressIndicator());
          }
           return ListTile(
            leading:CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(field.usersModel![index].avatar_url)),
            
            title: Text(field.usersModel![index].name),
            subtitle: Text(field.usersModel![index].username),

          );
          },
           
        ),
      )
    );
  }
}
