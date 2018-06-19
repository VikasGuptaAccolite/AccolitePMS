import 'package:flutter/material.dart';
import 'kra.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

class FeedBack extends StatefulWidget {
  final Kra kra;

  FeedBack (this.kra );

  @override
  createState() => new FeedBackState (kra);
  }
  

  class FeedBackState extends  State<FeedBack> {
    final Kra kra;
    FeedBackState(this.kra);

    @override


 Widget build(BuildContext context) {
  return new Scaffold (
    appBar: new AppBar(
      title: new Text("Goal - " + kra.goal),
    ),
    body: new Column(
          children: [
            new Text("Feedback => "+ kra.remarks,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.deepPurple,
              
            ),),
            new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.green,
                size: 48.0,
              ),
              onPressed: () {Navigator.pop(context); },
            ),
                        new IconButton(
              icon: new Icon(
                Icons.bug_report ,
                color: Colors.green,
                size: 48.0,
              ),
              onPressed: () async {
              print('Update data now....!!!!');
              String url = "https://script.google.com/macros/s/AKfycbw62MiIrGBtrfx59fizysETG-H2sPWUu8Z-VRI1SVT2_d91oZk/exec?id=19vljbQ5P-uU1d1yXrO6l5BP7CiwTzmu0UIKWR8v2_Po&sheet=Quarter-4&row="; 
              url = url + (kra.id + 13).toString() + "&rating=&remarks=" + kra.remarks+"updt1"; 
              print(url);
              var response = await http.get(
                // Uri.encodeFull("https://script.google.com/a/accoliteindia.com/macros/s/AKfycbwd6Esnt_dqsxTOExgNiQD0-YUn7UCVVZ_XyzZaqMI/dev?id=19vljbQ5P-uU1d1yXrO6l5BP7CiwTzmu0UIKWR8v2_Po&sheet=Quarter-4&row=20&rating=&remarks=updatedbyvikas"),
                Uri.encodeFull(url),
                headers: {
                "Accept": "application/json"
              }
              );
              },
            ),
          ], 
      ),
   );
}   
}