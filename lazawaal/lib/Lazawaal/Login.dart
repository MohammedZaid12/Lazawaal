
import 'package:flutter/material.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllInstances.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllControllers.dart';
import 'package:lazawaal/Lazawaal/SignUp.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Authentication/LoginAuthentication.dart';









class LazawaalLogin extends StatefulWidget {
  LazawaalLogin({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LazawaalLogin> {
  String username;
  String password;
  final _formKey = GlobalKey<FormState>();


  Future doLogin (map , success ) async{
    final response =await http.post(appUrls.loginUrl , body:map);

    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      throw new Exception("Error while fetching data");
    }
    var  _resp = json.decode(response.body);

    if(_resp["error"] == false){
      var obj = LoginAuth.fromjson(_resp["data"]);
      success(obj);
      print(_resp["success"]);
      print(obj);
      return obj;
    }
    else{
      print(_resp["error"]);
      print("djfwo8yhid");


      cFunc.dialogBox("Error", _resp["error"] ,context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
          children: <Widget>[

      Padding(
      padding: EdgeInsets.all(15.0),
      child: cFunc.logoImageAdd(200.0, 100.0),
    ),
    Padding(
    padding: EdgeInsets.all(15.0),
    child: cFunc.textFields("VALIDAION", (v){this.setState(() {this.username=v ;});}, "User Name", "User Name" , obscuretext: false , controller: UsernameController),
    ),
    Padding(
    padding: EdgeInsets.all(15.0),
    child: cFunc.textFields("a", (v){this.setState(() {this.password=v ;});}, "Password", "Password" , obscuretext: true , controller: passController),
    ),

            Padding(
    padding: EdgeInsets.all(15.0),
    child: cFunc.buttons("Login", (){

      if(username!=""&&password!=""){
        var map = new Map<String, dynamic>();
        map["username"] = username.toString();
        map["password"] = password.toString();

        doLogin(map, (LoginAuth log){
          print("welcome");
        });


      }




    })),
    Padding(
    padding: EdgeInsets.all(15.0),
    child: cFunc.buttons("Sign Up", (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LazawaalSignUp()));

    })),
    ],
    ),
    );
    }
}
