
import 'package:flutter/material.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllInstances.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllControllers.dart';
import 'package:lazawaal/Lazawaal/Login.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LazawaalSignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<LazawaalSignUp> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
//
  Future<File> imageFile;
//

//
  pickImageFromGallery(ImageSource source) {
    print("aa");
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

//
//  startUpload() {
//
//    String fileName = tmpFile.path.split('/').last;
//    upload(fileName);
//  }

//  upload(String fileName) {
//    http.post(uploadEndPoint, body: {
//      "image": base64Image,
//      "name": fileName,
//    }).then((result) {
//      setStatus(result.statusCode == 200 ? result.body : errMessage);
//    }).catchError((error) {
//      setStatus(error);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: Form(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.logoImageAdd(200.0, 100.0),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("VALIDAION", (v) {
                print(v);
              }, "Name", "Name",
                  obscuretext: false, controller: UsernameController),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                print(v);
              }, "Email", "Email", tType: TextInputType.emailAddress),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                print(v);
              }, "Password", " Password",
                  obscuretext: true, controller: passController),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
                child: RaisedButton(
                  child: Text("Select Image from Gallery"),
                  onPressed: () {
                    pickImageFromGallery(ImageSource.gallery);
                  },
                ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                print(v);
              }, "Phone Nuumber", "Phone Nuumber", tType: TextInputType.phone),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                print(v);
              }, "Income", "Income", tType: TextInputType.number),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                print(v);
              }, "Guardian Name", "Guardian Name", tType: TextInputType.text),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                print(v);
              }, "Guardian Nic", "Guardian Nic", tType: TextInputType.number),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                print(v);
              }, "Guardian Contact", "Guardian Contact",
                  tType: TextInputType.text),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.DatePicker(context, selectedDate, (date) {
                setState(() {
                  selectedDate = date;
                });
                print(date);
              }),
            ),
            Padding(
                padding: EdgeInsets.all(15.0),
                child: cFunc.buttons("Sign Up", () {})),
            Padding(
                padding: EdgeInsets.all(15.0),
                child: cFunc.buttons("Back To Login", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LazawaalLogin()));
                })),
          ],
        ),
      ),
    );
  }
}
