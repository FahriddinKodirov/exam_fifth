import 'package:firebase_app/data/models/firebase_model/student_model.dart';
import 'package:firebase_app/data/servicers/file_uploader.dart';
import 'package:firebase_app/screen/students_page/add_student.dart';
import 'package:firebase_app/utils/my_utile.dart';
import 'package:firebase_app/view_model/firebase_view_model/students_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UpdateStudent extends StatefulWidget {
  const UpdateStudent({Key? key, required this.studentModel})
      : super(key: key);

  final StudentModel studentModel;

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  final TextEditingController nameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String image_url = '';
  bool isLoading = false;


  @override
  void initState() {
    nameController.text = widget.studentModel.studentName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Update Student"),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
             TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: getInputDecoration(label: "Name"),
              ),
              InkWell(
                onTap: (){
                  _showPicker(context);
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
                      height: MediaQuery.of(context).size.height * 0.046,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                          child: Text(
                        'Gange Image',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))),
                ),
              ),
            
              InkWell(
                onTap: (){
                  StudentModel studentModel = StudentModel(
                    imageUrl: widget.studentModel.imageUrl,
                    studentId: widget.studentModel.studentId,
                    studentName: nameController.text,
                  );

                  Provider.of<StudentsViewModel>(context,listen: false).updateaStudent(studentModel);

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
                        'Update Studnet',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))),
                ),
              ),
             
            ],
          ),
        ),
      )
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
