import 'dart:async';
import 'package:firebase_app/data/models/firebase_model/student_model.dart';
import 'package:firebase_app/data/repositories/firebase_repositories/students_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentsViewModel extends ChangeNotifier {
  final StudentsRepo studentsRepo;
  final FirebaseAuth firebaseAuth;
  
  StudentsViewModel({required this.studentsRepo,
                     required this.firebaseAuth,
  }) {
    listenStudents();
    listenUser();
    notifyListeners();
  }
 
  late StreamSubscription subscription;

  List<StudentModel> students = [];

  // int lenthProduct = 0;

  listenStudents() async {
    subscription = studentsRepo
       .getStudents()
       .listen((allProducts) { 
        print("ALL PRODUCTS LENGTH:${allProducts.length}");
        students = allProducts;
        notifyListeners();
       });
  }
  addStudent(StudentModel studentModel) =>
      studentsRepo.addStudent(studentModel: studentModel);

  updateaStudent(StudentModel studentModel) =>
      studentsRepo.updateStudent(studentModel: studentModel);

  deleteStudent(String docId) => studentsRepo.deleteStudent(docId: docId);

   @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
  updatePhoto(String photo) {
  firebaseAuth.currentUser!.updatePhotoURL(photo);
  notifyListeners();
  }

User? user;

  Stream<User?> getCurrentUser() {
    notifyListeners();
    return firebaseAuth.authStateChanges();
    
  }

  listenUser() {
    firebaseAuth.authStateChanges().listen((updatedUser) {
      user = updatedUser;
      notifyListeners();
    });
  }
}


