// Testing the VC with dart ----
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'kra.dart';
import 'Feedback.dart';

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
      // print('decoding json now...');
      // data = json().decode(response.body);
      data = json().decode(tmpJSON);
      // print(data.toString());
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
          // print('Row $index is = ' + data[index].toString() );
          // return new Card(
          //   child: new Text("Goal:" + data[index]["Goal"] + '\n'+ "Feedback:" + data[index]["Remarks"]),
          return new KraWidget(new Kra.fromJson(data[index], index) ) ;
        },
      ),
    );
  }
}

class KraWidget extends StatelessWidget{
  final Kra kra;
  KraWidget(this.kra);

  // BuildContext get context => null;

  @override
  
  Widget build(BuildContext context){
    // print("Inside buildwidget with index = " + kra.id.toString() );
    return new GestureDetector(
        onHorizontalDragEnd: (DragEndDetails x) {
          print("Horizontally dragged!!!, Drag end details were - " + x.toString() );

        },
        onTap: (){
          _pushFeedBack(kra, context);
          print('Gesture detected for Goal with id - ' + kra.id.toString());
        },
          child: new Card(
            
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("Goal : " + kra.goal + '\n\n' + "Feedback is - " + kra.remarks ),
            ),
      ),
    );
  }

  _pushFeedBack (Kra kra, BuildContext context ) {
    print("inside pushfeedback now...");
  // BuildContext context;
    Navigator.of( context).push(
    new MaterialPageRoute(
      builder: (context) => new FeedBack(kra), 
    )
  );
}

}

// class KRAWidget extends StatelessWidget {
//   KRAWidget(this.place);
//   // final places.Place place;

//   @override
//   Widget build(BuildContext context) {
//     // Normalize rating to (0,1) and interpolate color from red to green
//     var ratingColor = Color.lerp(Colors.red, Colors.green, place.rating / 5);

//     var listTile = new ListTile(
//       leading: new CircleAvatar(
//         child: new Text(place.rating.toString()),
//         backgroundColor: ratingColor,
//       ),
//       title: new Text(place.name),
//       subtitle: new Text(place.address ?? "unknown ..."),
//       isThreeLine: false,
//     );

//     return new Dismissible(
//       key: new Key(place.name),
//       onDismissed: (dir) => dir == DismissDirection.startToEnd
//           ? print('You favorited ${place.name}!')
//           : print('You dismissed ${place.name} ...'),
//       background: new Container(
//         color: Colors.green,
//       ),
//       secondaryBackground: new Container(color: Colors.red),
//       child: listTile,
//     );
//   }
// }
