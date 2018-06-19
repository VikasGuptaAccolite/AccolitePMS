import 'package:flutter/material.dart';
import 'kra.dart';

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
    body: new Padding(
      padding: new EdgeInsets.all(16.0),
      child: new Text("Feedback - " + kra.remarks )
    )
  );
}   
}