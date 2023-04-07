

import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(child: Text("Page Not Found",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
    );
  }
}
