import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lazawaal/Lazawaal/Authentication/SignUpAuthentication.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllInstances.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllControllers.dart';
import 'package:lazawaal/Lazawaal/Login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

//import "package:image_picker_modern/image_picker_modern.dart";
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

  File imageFile;

  Future doSignUp(String url, {Map body}) {

    return http
        .post(url,
            body: body, headers: tokenWithHeader.authWithTokenHeaders(""))
        .then((http.Response response) {
      final int StatusCode = response.statusCode;
      var _resp = json.decode(response.body);

      if (StatusCode < 200 || StatusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      } else if (_resp["error"] == true) {
        print("hwef");
        cFunc.dialogBox(context, "Error", _resp["errorMessage"]);
      } else {
         SignUpAuth.fromjson(_resp);
         return isSuccessFullyLogin();
      }
    });
  }

  Future<void> getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);

    setState(() {
      imageFile = image;
    });
  }

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
                ;
              }, "Name", "Name",
                  obscuretext: false, controller: UsernameController),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                ;
              }, "Email", "Email",
                  tType: TextInputType.emailAddress,
                  obscuretext: false,
                  controller: emailCtrl),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                ;
              }, "Password", " Password",
                  obscuretext: true, controller: passController),
            ),
//            Padding(
//              padding: EdgeInsets.all(15.0),
//                child: RaisedButton(
//                  child: Text("Select Image from Gallery"),
//                  onPressed: () {
//                    getImage(ImageSource.gallery);
//                  },
//                ),
//            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                ;
              }, "Phone Nuumber", "Phone Nuumber",
                  tType: TextInputType.phone,
                  obscuretext: false,
                  controller: phoneCtrl),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                ;
              }, "Income", "Income",
                  tType: TextInputType.number,
                  obscuretext: false,
                  controller: incomeCtrl),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                ;
              }, "Guardian Name", "Guardian Name",
                  tType: TextInputType.text,
                  obscuretext: false,
                  controller: guradianNameCtrl),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                ;
              }, "Guardian Nic", "Guardian Nic",
                  tType: TextInputType.number,
                  obscuretext: false,
                  controller: guardianNicCtrl),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v) {
                ;
              }, "Guardian Contact", "Guardian Contact",
                  tType: TextInputType.text,
                  obscuretext: false,
                  controller: guardianContactCtrl),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.DatePicker(context, selectedDate, (date) {
                setState(() {
                  selectedDate = date;
                });
                print(date);
                print(selectedDate);
              }),
            ),
            Padding(
                padding: EdgeInsets.all(15.0),
                child: cFunc.buttons("Sign Up", () async {
                  try {
                    print("try mein");
                    SignUpAuth post = new SignUpAuth(
                        Id: 0,
                        userId: "123",
                        name: UsernameController.text,
                        password: passController.text,
                        phoneNumber: phoneCtrl.text,
                        guardianName: guradianNameCtrl.text,
                        guardianContact: guardianContactCtrl.text,
                        DateOfBirth: selectedDate.toString(),
                        income: incomeCtrl.text,
                        email: emailCtrl.text,
                        guardianNic: guardianNicCtrl.text);

                    print("aya");
                    print(post.name);
                    print(post.Id);
                    print(post.userId);
                    print(post.password);
                    print(post.guardianName);
                    print(post.phoneNumber);
                    print(post.guardianContact);
                    print(post.guardianNic);
                    print(post.income);
                    print(post.email);
                    print(post.DateOfBirth);

                    SignUpAuth lazawalSignupAuth =
                        await doSignUp(appUrls.registerUrl, body: post.tomap());

                    print(lazawalSignupAuth);
                  } catch (Exception) {
                    print(Exception);
                    print("pata nahi");
                  }
                })),
          ],
        ),
      ),
    );
  }
  isSuccessFullyLogin(){

      return showDialog(
          context:  context,
          builder: (BuildContext buildContext) {
            return AlertDialog(
              title: Text("Congrats!"),
              content: Text("You have Successfully Signed Up"),
              actions: [
                FlatButton(
                  child: Text("Login"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>LazawaalLogin()));
                  },
                )


              ],
            );
          });

  }
}
