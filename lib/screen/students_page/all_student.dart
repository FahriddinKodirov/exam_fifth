import 'package:firebase_app/screen/students_page/add_student.dart';
import 'package:firebase_app/screen/students_page/update_student.dart';
import 'package:firebase_app/view_model/firebase_view_model/students_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllStudent extends StatefulWidget {
  const AllStudent({Key? key}) : super(key: key);

  @override
  State<AllStudent> createState() => _AllStudentState();
}

class _AllStudentState extends State<AllStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Students"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddStudent()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<StudentsViewModel>(
        builder: (context, studentsViewModel, child) {
          return ListView.builder(
            itemCount: studentsViewModel.students.length,
            itemBuilder: (context, index) {
              var student = studentsViewModel.students[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: ListTile(
                  title: Text(student.studentName),
                  leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      
                      radius: 30,
                      foregroundImage: NetworkImage(student.imageUrl)),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateStudent(
                                    studentModel: student,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit,color: Colors.black,)),
                        IconButton(
                            onPressed: () {
                              context
                                  .read<StudentsViewModel>()
                                  .deleteStudent(student.studentId);
                            },
                            icon: const Icon(Icons.delete,color: Colors.red,)),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
