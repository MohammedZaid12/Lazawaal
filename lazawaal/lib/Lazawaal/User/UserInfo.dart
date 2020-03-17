import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:lazawaal/Lazawaal/Authentication/GetProfile.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllInstances.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserCardState();
  }
}

class UserCardState extends State<UserCard> {
  Future<GetUserProfile> fetchUserProfile() async {
    SharedPreferences Prefrence = await SharedPreferences.getInstance();
    var response = await get(appUrls.getProfileUrl,
        headers: tokenWithHeader
            .authWithTokenHeaders(Prefrence.getString(cKeys.token)));
    if (response.statusCode == 200) {
      var _resp = json.decode(response.body);
      return GetUserProfile.fromjson(_resp);
    } else {
      // If the server did not return a 200 OK response, then thRow an exception.
      throw Exception('Failed to load Profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
          height: 200.0,
          width: 1.0,
        decoration: BoxDecoration(

            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),

          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lightBlueAccent, Colors.lightBlue  , Colors.purpleAccent])),
//          color: Colors.lightBlueAccent,
          child: ListView(
            children: <Widget>[
              Row(

                children: <Widget>[
                  Container(height: 200.0, width: 100.0,child:Column(children: <Widget>[Container(child: userImage(100.0, 100.0  ),),Container(padding: EdgeInsets.all(5.0),) , Row(children: <Widget>[Icon(Icons.loyalty , color: Colors.white,)  , Container(padding: EdgeInsets.only( right:3.0 ),) , Text("Loyality " , style: TextStyle(fontSize: 20.0 , color: Colors.white),),],) ,Container(padding: EdgeInsets.all(15.0),) ,Text("500", style: TextStyle(color: Colors.white , fontSize: 20.0)) ,], ) ),
                  VerticalDivider(color: Colors.white,
                    thickness: 2, width: 10,
                ),Container(margin: EdgeInsets.only(top:20.0),),
                  Container(height: 45.0, width: 100.0,margin: EdgeInsets.only(top: 47.0) , child: Column(children: <Widget>[Row(children: <Widget>[Icon(Icons.score, color: Colors.white,) , Container(padding: EdgeInsets.all(2.0),) , Text("Score" , style: TextStyle(fontSize: 20.0 , color: Colors.white))],) ,Container(  padding: EdgeInsets.all(3.0),     child:Text("500" , style: TextStyle(fontSize:   20.0 , color: Colors.white)))],),),
 VerticalDivider(color: Colors.white,
                    thickness: 2, width: 5.0,
                ),
                  Container(height: 200.0, width: 150.0,child: Column(children: <Widget>[Row(children: <Widget>[  Container(margin: EdgeInsets.only(right:50.0,top:10.0),padding: EdgeInsets.only(top: 50.0),), Icon(Icons.edit, color: Colors.white,) , Container(padding: EdgeInsets.all(2.0),) , Text("Edit" , style: TextStyle(fontSize:   20.0 , color: Colors.white))],) , Container( ), Text(" Zaid" ,  style: TextStyle(fontSize:   20.0 , color: Colors.white) , ) , Container(margin: EdgeInsets.only(right:50.0) , padding: EdgeInsets.only(right: 40.0))  , Row(children: <Widget>[  Container(margin: EdgeInsets.only(right:41.0,top:10.0),padding: EdgeInsets.only(top: 67.0),), Icon(Icons.monetization_on, color: Colors.white,) , Container(padding: EdgeInsets.all(2.0),) , Text("Spent" , style: TextStyle(fontSize:   20.0 , color: Colors.white))],), Text("500" , style: TextStyle(fontSize:   20.0 , color: Colors.white))],),),
                ],
              ),
//



            ],
          ),
        )
      ]),
    );
  }

  Widget userImage(height, margin) {
    AssetImage assetImage = new AssetImage("images/fwfwefdwef.png");
    Image image = new Image(
      image: assetImage,
      width: margin,
      height: height,

    );
    return Container(
      child: image,
    );
  }
}
