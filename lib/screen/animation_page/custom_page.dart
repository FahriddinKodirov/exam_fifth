import 'dart:ui';
import 'package:firebase_app/screen/animation_page/my_painter/my_painter.dart';
import 'package:flutter/material.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Custom"),
         
        ),
        body: 
            Container(
              color: Colors.green[400],
              child: CustomPaint(
                size: const Size(double.infinity,1000),
                painter: MyPainter(),
              ),
            ),
           
        
        );
  }
}

