import 'package:flutter/material.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllInstances.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllControllers.dart';


class LazawaalSignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<LazawaalSignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _formKey,
      body: Form(
        child:  ListView(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.logoImageAdd(200.0, 100.0),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("VALIDAION", (v){print(v);}, "Name", "Name" , obscuretext: false , controller: UsernameController),
            ),

            Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v){print(v);}, "Email", "Email" , tType: TextInputType.emailAddress),
            ), Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v){print(v);}, "Password", " Password" , obscuretext: true , controller: passController ),
            ), Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v){print(v);}, "Phone Nuumber", "Phone Nuumber"  ,  tType: TextInputType.phone),
            ), Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.textFields("a", (v){print(v);}, "NIC", "NIC" , tType: TextInputType.number ),
            ), Padding(
              padding: EdgeInsets.all(15.0),
              child: cFunc.DatePicker(context ),
            ),
            Padding(
                padding: EdgeInsets.all(15.0),
                child: cFunc.buttons("Login", (){})),
            Padding(
                padding: EdgeInsets.all(15.0),
                child: cFunc.buttons("Sign Up", (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LazawaalSignUp()));

                })),

          ],
        ),


      ),
    );
  }
}
