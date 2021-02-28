

import 'package:city_care/view_models/incident_list_view_model.dart';
import 'package:city_care/view_models/my_incident_list_view_model.dart';
import 'package:city_care/widgets/incident_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyIncidentsPage extends StatefulWidget {
  @override 
  _MyIncidentsPage createState() => _MyIncidentsPage(); 
}

class _MyIncidentsPage extends State<MyIncidentsPage> {

  List<IncidentViewModel> _incidents = List<IncidentViewModel>(); 
  MyIncidentListViewModel _myIncidentsListVM = MyIncidentListViewModel();

  @override
  void initState() {
    super.initState();
    _populateMyIncidents(); 
  }

  void _populateMyIncidents() async {

    final incidents = await _myIncidentsListVM.getMyIncidents();
    setState(() {
      _incidents = incidents; 
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("My Incidents"), 
      ), 
      body: Column(children: [
        Expanded(
          child: IncidentList(_incidents)
        )
      ])
    );
    
  }
}