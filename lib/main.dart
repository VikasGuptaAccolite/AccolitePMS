import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;
  String tmpJSON;
  
  Future<String> getData() async {
    // // var response = await http.get(
    //   // Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
    // //  write data -- 
    //     // Uri.encodeFull("https://script.google.com/macros/s/AKfycbzOUIMN82DmBLgWsmp-AKXchuUHYMJYjKZ_d7iZirFdmNJOaeQ/exec?name=SaiTatsat Gupta&country=India&id=1hXOg8TONsTa5mhgQ9tjk9Sj75xGVWvWsuJKt_qf3PMY"),
    // print("reaching out to the server!!!");
    //   var response = await http.get(
    //      Uri.encodeFull("https://script.google.com/macros/s/AKfycbw62MiIrGBtrfx59fizysETG-H2sPWUu8Z-VRI1SVT2_d91oZk/exec?id=19vljbQ5P-uU1d1yXrO6l5BP7CiwTzmu0UIKWR8v2_Po&sheet=Quarter-4"),
    //   headers: {
    //     "Accept": "application/json"
    //   }
    // );
    // print ("Response is = " + response.body.toString() );

    tmpJSON = '[{"Goal":"Business Growth ","Brief_Objectives_":"","Target":"","Weightage":0.2,"Goals_achieved":"","Remarks":""},{"Goal":"Revenue growth (Quarter to Quarter)","Brief_Objectives_":"","Target":0.1,"Weightage":0.1,"Goals_achieved":"","Remarks":"Rev Growth Feedback"},{"Goal":"Customer Success","Brief_Objectives_":"","Target":0.9,"Weightage":0.1,"Goals_achieved":"","Remarks":"new feedback"},{"Goal":"Org Impact","Brief_Objectives_":"","Target":"","Weightage":0.2,"Goals_achieved":"","Remarks":""},{"Goal":"Number of Interviews conducted/ Campus Visits ","Brief_Objectives_":"","Target":30,"Weightage":0.05,"Goals_achieved":"","Remarks":""},{"Goal":"PMCoE initiative, Ilearn,Branding , Unplugged , Fun Friday , Process impovements,Location wide Activities  & others ","Brief_Objectives_":"","Target":"Very active participation","Weightage":0.15,"Goals_achieved":"","Remarks":""},{"Goal":"Delivery","Brief_Objectives_":"","Target":"","Weightage":0.45,"Goals_achieved":"","Remarks":""},{"Goal":"Utilization","Brief_Objectives_":"","Target":0.92,"Weightage":0.05,"Goals_achieved":"","Remarks":""},{"Goal":"Coding,Problem Solving, Quality, Design,","Brief_Objectives_":"","Target":"High Quality","Weightage":0.25,"Goals_achieved":"","Remarks":""},{"Goal":"Architeture Score Card ","Brief_Objectives_":"","Target":90,"Weightage":0.15,"Goals_achieved":"","Remarks":""},{"Goal":"Retention","Brief_Objectives_":"","Target":"","Weightage":0.15,"Goals_achieved":"","Remarks":""},{"Goal":"Retention","Brief_Objectives_":"","Target":0.9,"Weightage":0.15,"Goals_achieved":"","Remarks":""}]';


    this.setState(() {
      print('decoding json now...');
      // data = json().decode(response.body);
      data = json().decode(tmpJSON);
      print(data.toString());
    });
    // print(data[1]["Goal"]);

    return "Success!";
  }

  JsonCodec json() => JSON;

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Accolite PMS - Goal Details"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text("Goal:" + data[index]["Goal"] + '\n'+ "Feedback:" + data[index]["Remarks"]),
            
          );
        },
      ),
    );
  }
}
