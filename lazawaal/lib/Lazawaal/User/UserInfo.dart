import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class UserCard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return UserCardState();
  }

}


class UserCardState extends State<UserCard>{


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Simple Card view'),
      ),
      body: new ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          return Container(
            height: 130,
            child: Card(
//                color: Colors.blue,
              elevation: 10,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
//                        decoration: BoxDecoration(
//                            color: Colors.red,
//
//                            borderRadius:
//                            BorderRadius.all(Radius.circular(75.0)),
//                            boxShadow: [
//                              BoxShadow(blurRadius: 7.0, color: Colors.black)
//                            ]),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

}