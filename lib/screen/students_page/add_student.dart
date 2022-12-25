import 'package:firebase_app/data/models/firebase_model/student_model.dart';
import 'package:firebase_app/data/servicers/file_uploader.dart';
import 'package:firebase_app/utils/my_utile.dart';
import 'package:firebase_app/view_model/firebase_view_model/students_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  XFile? _image;
  String image_url = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
            child: Column(
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: getInputDecoration(label: "Name"),
            ),
            Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.25),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                     _showPicker(context);
                  }, icon: Icon(Icons.photo,size: 50,color: Colors.blueGrey,)), 
                  Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width*0.041,
                    left: MediaQuery.of(context).size.width*0.03,),
                    child: InkWell(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Text('Photo',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),)),
                  )
                ],
              ),
            ),
           


           InkWell(
              onTap: () {
                StudentModel studentModel = StudentModel(
                    imageUrl: image_url,
                    studentId: '',
                    studentName: nameController.text,
                  );
                  Provider.of<StudentsViewModel>(context, listen: false)
                      .addStudent(studentModel);
                 
              },
              child: Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
                child: Container(
                  
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(-3, 0),
                              blurRadius: 1,
                              spreadRadius: 1)
                        ]),
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Center(
                        child: Text(
                      'add student',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
              ),
            ),
          
            
          ],
        )),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: Colors.white,
                ),
                title: const Text(
                  "Gallery",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  _getFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                ),
                title: const Text(
                  'Camera',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  _getFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
        });
  }

  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1000,
      maxHeight: 1000,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      setState(() {
        isLoading = true;
      });
      if (!mounted) return;
      image_url = await FileUploader.imageUploader(pickedFile);
      if (!mounted) return;
      Provider.of<StudentsViewModel>(context, listen: false)
          .updatePhoto(image_url);
      setState(() {
        isLoading = false;
        _image = pickedFile;
      });
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      image_url = await FileUploader.imageUploader(pickedFile);
      if (!mounted) return;
      Provider.of<StudentsViewModel>(context, listen: false)
          .updatePhoto(image_url);
      setState(() {
        _image = pickedFile;
      });
    }
  }
}
