
import 'package:flutter/material.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllInstances.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllControllers.dart';
import 'package:lazawaal/Lazawaal/SignUp.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Authentication/LoginAuthentication.dart';









class LazawaalLogin extends StatefulWidget {
  LazawaalLogin({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LazawaalLogin> {
  String email;
  String password;
  String name;
  final _formKey = GlobalKey<FormState>();


  Future doLogin (map , success ) async{
    final response =await http.post(appUrls.loginUrl , headers: tokenWithHeader.authWithTokenHeaders(""), body:map);

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


      cFunc.dialogBox( context,"Error", _resp["errorMessage"] );
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
    child: cFunc.textFields("VALIDAION", (v){this.setState(() {this.email=v ;});}, "User Name", "User Name" , obscuretext: false , controller: UsernameController),
    ),
    Padding(
    padding: EdgeInsets.all(15.0),
    child: cFunc.textFields("a", (v){this.setState(() {this.password=v ;});}, "Password", "Password" , obscuretext: true , controller: passController),
    ),

            Padding(
    padding: EdgeInsets.all(15.0),
    child: cFunc.buttons("Login", ()async{

      SharedPreferences loginPrefrence =
          await SharedPreferences.getInstance();

      if(email!=""&&password!=""){
        var map = new Map<String, dynamic>();
        map["email"] = email.toString();
        map["password"] = password.toString();
        map["name"] = name.toString();

        loginPrefrence.setString(cKeys.email, map["email"]);
        loginPrefrence.setString(cKeys.name, map["email"]);

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
