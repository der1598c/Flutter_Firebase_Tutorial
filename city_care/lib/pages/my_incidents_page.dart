

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyIncidentsPage extends StatefulWidget {
  @override 
  _MyIncidentsPage createState() => _MyIncidentsPage(); 
}

class _MyIncidentsPage extends State<MyIncidentsPage> {


  @override
  void initState() {
    super.initState();
    _populateMyIncidents(); 
  }

  void _populateMyIncidents() async {
     

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("My Incidents"), 
      ), 
      body: Column(children: [

      ])
    );
    
  }
}