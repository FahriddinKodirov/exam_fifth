import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/data/models/firebase_model/student_model.dart';
import 'package:firebase_app/utils/my_utile.dart';


class StudentsRepo {
  final FirebaseFirestore _firestore;

  StudentsRepo({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addStudent({required StudentModel studentModel}) async {
    try {
      var newStudent =
          await _firestore.collection("students").add(studentModel.toJson());
      await _firestore.collection("students").doc(newStudent.id).update({
        "studentId": newStudent.id,
      });
      MyUtils.getMyToast(message: "Student muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch (eror) {
      MyUtils.getMyToast(message: eror.message.toString());
    }
  }

  Future<void> deleteStudent({required String docId}) async {
    try {
      await _firestore.collection("students").doc(docId).delete();
      MyUtils.getMyToast(message: "Student muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }

  Future<void> updateStudent({required StudentModel studentModel}) async {
    try {
      await _firestore
          .collection("students")
          .doc(studentModel.studentId)
          .update(
            studentModel.toJson(),
          );
      MyUtils.getMyToast(message: "student muvaffaqiyatli o'zgartrildi!");
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }

  Stream<List<StudentModel>> getStudents() async* {
    
      yield* _firestore.collection("students").snapshots().map(
            (querySnapshot) => querySnapshot.docs
            .map((doc) => StudentModel.fromJson(doc.data()))
            .toList(),
      );
    
      
  }
}