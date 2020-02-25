import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazawaal/Lazawaal/Login.dart';


void main() => runApp(LazawaalApp());

class LazawaalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lazawaal',
      home: Scaffold(
        body: LazawaalLogin(),

      ),
    );
  }
}
