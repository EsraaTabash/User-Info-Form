import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'UserInfo.dart';


class UserForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return UserFormState();
  }
}

class UserFormState extends State<StatefulWidget> {
  String name = "esraa";
  bool isDark = false;
  String gender = "";
  TextEditingController etc = TextEditingController();
  // bool diplomaSelected = false;
  // bool baSelected = false;
  // bool masterSelected = false;
  // bool phdSelected = false;
  List<certificate> certificates =[
    certificate("Diploma"),
    certificate("Ba"),
    certificate("Master"),
    certificate("Phd"),
  ];


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: !isDark?ThemeData.dark():ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("User Form"),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          actions: [
            Switch(value: isDark, onChanged: (value){
              isDark=value;
              setState(() {});
            })

          ],
        ),
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(name),
              // ElevatedButton(child:Text("Change Name"),onPressed: (){
              //   name=name=="esraa"?"rashed":"esraa";
              //   setState(() {});
              // })
              Container(
                margin: EdgeInsetsDirectional.all(15),
                padding: EdgeInsetsDirectional.all(5),
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(children: [
                  Text("Name   ",style: TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 18,
                    color: Colors.white,
                  ),),
                  Expanded(child: TextField(controller: etc,))
                ],),
              )
              ,Container(
                margin: EdgeInsetsDirectional.all(15),
                padding: EdgeInsetsDirectional.all(5),
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Text("Gender   ",style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 18,
                      color: Colors.white,
                    ),),
                    Expanded(child:
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(value: "m", groupValue: gender, onChanged: (v){
                              gender="m";
                              setState(() {

                              });
                            })
                            ,Text("Male",style: TextStyle(
                              fontFamily: "Raleway",
                              color: Colors.black87,
                            ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: "f", groupValue: gender, onChanged: (v){
                              gender="f";
                              setState(() {

                              });
                            })
                            ,Text("Female",style: TextStyle(
                              fontFamily: "Raleway",
                              color: Colors.black87,),)
                          ],
                        )
                      ],
                    )
                    )
                  ],),
              )
              ,Container(
                margin: EdgeInsetsDirectional.all(15),
                padding: EdgeInsetsDirectional.all(5),
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Text("Certifications   ",style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 18,
                      color: Colors.white,
                    ),),
                    Expanded(child:
                    Column(
                        children:
                        certificates.map((e) {
                          return  Row(
                            children: [
                              Checkbox(value: e.isSelected, onChanged: (v){
                                e.isSelected=!e.isSelected;
                                setState(() {
                                });
                              })
                              ,Text(e.name,style: TextStyle(
                                fontFamily: "Raleway",
                                color: Colors.black87,
                              ),
                              ),
                            ],
                          );
                        }).toList()
                      // Row(
                      //   children: [
                      //     Checkbox(value: diplomaSelected, onChanged: (v){
                      //       diplomaSelected=!diplomaSelected;
                      //       setState(() {
                      //       });
                      //     })
                      //     ,Text("Diploma",style: TextStyle(
                      //       fontFamily: "Raleway",
                      //       color: Colors.black87,
                      //     ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Checkbox(value: baSelected, onChanged: (v){
                      //       baSelected=!baSelected;
                      //       setState(() {
                      //       });
                      //     })
                      //     ,Text("Ba",style: TextStyle(
                      //       fontFamily: "Raleway",
                      //       color: Colors.black87,
                      //     ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Checkbox(value: masterSelected, onChanged: (v){
                      //       masterSelected=!masterSelected;
                      //       setState(() {
                      //       });
                      //     })
                      //     ,Text("Master",style: TextStyle(
                      //       fontFamily: "Raleway",
                      //       color: Colors.black87,
                      //     ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Checkbox(value: phdSelected, onChanged: (v){
                      //       phdSelected=!phdSelected;
                      //       setState(() {
                      //       });
                      //     })
                      //     ,Text("Phd",style: TextStyle(
                      //       fontFamily: "Raleway",
                      //       color: Colors.black87,
                      //     ),
                      //     ),
                      //   ],
                      // ),

                    )
                    )
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){
                String nameSend = etc.text;
                String genderSend = gender=="m"?"Male":"Female";
                List<certificate> certificationsSend = certificates.where((element) => element.isSelected).toList();
                //log("esraa");
                // log(nameSend);
                // log(genderSend);
                // log(certificationsSend);
                //Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  //return UserInfo(nameSend,genderSend,certificationsSend);
                  UserInfoParameters userInfoParameters = UserInfoParameters(nameSend, genderSend, certificationsSend);
                   //return UserInfo( ) ;
                  // setState(() {
                  //
                  // });
                  //}));
                //Navigator.pushReplacementNamed(context, "/UserInfo");
                Navigator.of(context).pushNamed('/Use,rInfo',arguments: userInfoParameters);
              }, child: Text("Send Data")),
              ElevatedButton(onPressed: (){
                //Navigator.of(context).pop();
               if( Navigator.of(context).canPop() ){
                    Navigator.of(context).pop();
               }else{
                 showGeneralDialog(context: context, pageBuilder: (x,y,z){
                   return AlertDialog(
                        title:Text("Alert"),
                        content:Text("Are you sure? You will exit the app if you press on back"),
                       actions: [
                         TextButton(onPressed: (){exit(0);}, child: Text("ok")),
                         TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("cancel")),
                       ]
                   );
                 });
               }
              }, child: Text("back"))

            ],
          ),
        ),
      ),
    );
  }
}



class certificate{
  String name;
  bool isSelected= false;
  certificate(this.name);
}

class UserInfoParameters{
  String name;
  String gender;
  List<certificate> certifications;
  UserInfoParameters(this.name,this.gender,this.certifications);

}
