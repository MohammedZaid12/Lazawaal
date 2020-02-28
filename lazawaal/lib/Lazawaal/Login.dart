import 'package:flutter/material.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllInstances.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllControllers.dart';
import 'package:lazawaal/Lazawaal/SignUp.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lazawaal/Lazawaal/User/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Authentication/LoginAuthentication.dart';

class LazawaalLogin extends StatefulWidget {
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

  Future doLogin(map, success) async {
    SharedPreferences Prefrence =
    await SharedPreferences.getInstance();
    final response = await http.post(appUrls.loginUrl,
        headers: tokenWithHeader.authWithTokenHeaders(Prefrence.getString(cKeys.token)), body: map);

    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      throw new Exception("Error while fetching data");
    }
    var _resp = json.decode(response.body);

    if (_resp["error"] == false) {
      var obj = LoginAuth.fromjson(_resp["data"]);
      success(obj);
      print(_resp["success"]);
      print(obj);
      return obj;
    } else {
      print(_resp["error"]);
      print("login mein error");

      cFunc.dialogBox(context, "Error", _resp["errorMessage"]);
    }
  }

  @override
  void initState() {
    super.initState();
    getPrefIdUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: cFunc.logoImageAdd(200.0, 100.0),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: cFunc.textFields("VALIDAION", (v) {
              this.setState(() {
                this.email = v;
              });
            }, "Email", "Email", obscuretext: false, controller: emailCtrl),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: cFunc.textFields("a", (v) {
              this.setState(() {
                this.password = v;
              });
            }, "Password", "Password",
                obscuretext: true, controller: passController),
          ),
          Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.buttons("Login", () async {
                SharedPreferences loginPrefrence =
                    await SharedPreferences.getInstance();

                if (email != "" && password != "") {
                  print(email);
                  var map = new Map<String, dynamic>();
                  map["Email"] = email.toString();
                  map["Password"] = password.toString();




                  this.doLogin(map, (LoginAuth log) {
                    print(log.user_id);
                    loginPrefrence.setString(cKeys.email, log.email);
                    loginPrefrence.setBool("isLogin", true);
                    loginPrefrence.setString(cKeys.token, log.token);
//                    loginPrefrence.setString(cKeys, log.email);

                  });
                }
              })),
          Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.buttons("Sign Up", () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LazawaalSignUp()));
              })),
        ],
      ),
    );
  }



  String checkPreftoken;
  String checkPrefemail;
  bool checkPrefisLogin;
  getPrefIdUser() async {


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkPreftoken = sharedPreferences.getString(cKeys.token);
      checkPrefemail = sharedPreferences.getString(cKeys.email);
      checkPrefisLogin = sharedPreferences.getBool("isLogin");

      if (checkPreftoken == null && checkPrefemail==null && checkPrefisLogin==false) {
        print("check null");
        return false;

      } else {
        print("fjoifjd");
        Navigator.pushAndRemoveUntil(
            context, routeToUserCard, (Route<dynamic> r) => false);
      }

    });
  }

  final PageRouteBuilder routeToUserCard = new PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return UserCard();
    },
  );

}


