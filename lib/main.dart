import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/data/api_service/api_service.dart';
import 'package:firebase_app/data/repositories/dio_repositories/users_repo.dart';
import 'package:firebase_app/data/repositories/firebase_repositories/students_repo.dart';
import 'package:firebase_app/screen/home_page.dart';
import 'package:firebase_app/view_model/dio_view_model/users_view_model.dart';
import 'package:firebase_app/view_model/firebase_view_model/students_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic("users");

  var fireStore = FirebaseFirestore.instance;
  runApp(
    MultiProvider(
      providers: [
     
        
        ChangeNotifierProvider(create: (context)=>UsersViewModel(usersRepo: UsersRepo(apiService: ApiService())),child: MyApp()),
        ChangeNotifierProvider(
          create: (context) => StudentsViewModel(
            studentsRepo: StudentsRepo(
              firebaseFirestore: fireStore,
            ), firebaseAuth: FirebaseAuth.instance,
          ),
        ),
       
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

