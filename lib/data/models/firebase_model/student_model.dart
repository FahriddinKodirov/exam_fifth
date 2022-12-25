class StudentModel{
 String studentId;
 String studentName;
 String imageUrl;


 StudentModel({ required this.studentId,
                required this.studentName,
                required this.imageUrl,
               });
  
factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      studentId: json['studentId'] ?? "",
      studentName: json['studentName'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
  );
  }

 Map<String, dynamic> toJson() => {
        'studentId': studentId,
        "studentName": studentName,
        "imageUrl": imageUrl,
        
    };

     @override
  String toString() {
    return '''
      studentId: $studentId,
      studentName: $studentName,
      imageUrl: $imageUrl,
   
      ''';
  }

}