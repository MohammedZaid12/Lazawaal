import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lazawaal/Lazawaal/Authentication/GetProfile.dart';
import 'package:lazawaal/Lazawaal/CommonThings/AllInstances.dart';
import 'package:shared_preferences/shared_preferences.dart';

  class UserGetProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return UserGetProfileState();
  }

}

class UserGetProfileState extends State<UserGetProfile>{

  Future  <List<GetUserProfile>> fetchUserProfile() async {
    SharedPreferences Prefrence = await SharedPreferences.getInstance();
    var response = await get(appUrls.getProfileUrl,
        headers: tokenWithHeader
            .authWithTokenHeaders(Prefrence.getString(cKeys.token)));
    if (response.statusCode == 200) {
      var _resp = json.decode(response.body);
      return _resp.map((userprof)=>new GetUserProfile.fromjson(userprof)).toList();
    } else {
      // If the server did not return a 200 OK response, then thRow an exception.
      throw Exception('Failed to load Profile');
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.purple,

       title: Text("Profile",style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 20.0),),
     ),
     body: Center(
       child:prof(context) ,
     )
   );
  }
  ListView profile(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].name, data[index].email, Icons.work);
        });
  }

  Widget prof(BuildContext context) {
    return FutureBuilder<List<GetUserProfile>>(
      future: fetchUserProfile(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<GetUserProfile> data = snapshot.data;
          return profile(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );


}

