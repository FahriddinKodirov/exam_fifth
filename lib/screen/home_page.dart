import 'package:firebase_app/screen/animation_page/custom_page.dart';
import 'package:firebase_app/screen/dio_page/dio_home_page.dart';
import 'package:firebase_app/screen/students_page/all_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Exam 5'),
        ),
        body: Container(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.17),
          child: Column(children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AllStudent()));
              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.25),
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
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Center(
                        child: Text(
                      'Firebase',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DioHomePage()));
              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.25),
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
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Center(
                        child: Text(
                      'Dio',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CustomPage()));
              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.25),
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
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Center(
                        child: Text(
                      'Animation',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
              ),
            ),
          ]),
        ));
  }
}
