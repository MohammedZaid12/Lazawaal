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
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView( children: <Widget>[
        Container(
            color: Colors.deepPurpleAccent,
            height: 200.0,
            width: 55.0,


              child: ListView(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(children: <Widget>[
                        Container(
//                          padding:  EdgeInsets.only(right: 100.0),
//                          margin: EdgeInsets.only(right: 300.0),
                          child:userImage(50.0, 50.0),

                        )
                        ,

                        Padding(padding: EdgeInsets.only(bottom :50.0 , right: 10.0),),
                        Container(
//                          padding:  EdgeInsets.only(right: 100.0),

                          child:Row(
                            children: <Widget>[
                              Icon(
                               Icons.loyalty
                              ),
                              Padding(padding: EdgeInsets.all(7.0),),
                              Text("Loyalty Points")
                            ],
                          ),
                        )
                      ],),

                    ],
                  ),
                  Column(),
                  Column()
                ],
              ),
            )
      ]),
    );
  }

  Widget userImage(height, margin) {
    AssetImage assetImage = new AssetImage("images/userim.jpg");
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
