
import 'package:flutter/material.dart';
import 'package:training_app_5/UserForm.dart';

class UserInfo extends StatelessWidget {
  // String name;
  // String gender;
  // List<certificate> certifications;
  // UserInfo(this.name,this.gender,this.certifications);
  UserInfoParameters? userInfoParameters;

  @override
  Widget build(BuildContext context) {
    userInfoParameters = ModalRoute.of(context)?.settings.arguments as UserInfoParameters;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Info"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          ListTile(
            title:Text("Name",style: TextStyle(
              fontFamily: "Raleway",
              color: Colors.lightBlueAccent,
            ),) ,
            //subtitle:Text(name,style: TextStyle(
            subtitle:Text(userInfoParameters?.name ?? "",style: TextStyle(
            fontFamily: "Raleway",
              color: Colors.black87,
            ),) ,
          ),
          ListTile(
            title:Text("Gender",style: TextStyle(
              fontFamily: "Raleway",
              color: Colors.lightBlueAccent,
            ),) ,
            //subtitle:Text(gender,style: TextStyle(
            subtitle:Text(userInfoParameters?.gender ?? "",style: TextStyle(
            fontFamily: "Raleway",
              color: Colors.black87,
            ),) ,
          ),
          ListTile(
            title:Text("Certifications",style: TextStyle(
              fontFamily: "Raleway",
              color: Colors.lightBlueAccent,
            ),) ,

          //subtitle:Text(certifications.fold("", (previousValue, element) => previousValue+"  "+element.name),style: TextStyle(
            subtitle:Text(userInfoParameters?.certifications == null ? "" : userInfoParameters!.certifications.fold("", (previousValue, element) => previousValue+"  "+element.name),style: TextStyle(
            fontFamily: "Raleway",
              color: Colors.black87,
            ),) ,
          ),

        ],
      ),
    );
  }
}
