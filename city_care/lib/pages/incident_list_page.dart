
import 'package:city_care/pages/my_incidents_page.dart';
import 'package:city_care/utils/app_navigator.dart';
import 'package:city_care/view_models/incident_list_view_model.dart';
import 'package:city_care/widgets/empty_or_no_items.dart';
import 'package:city_care/widgets/incident_list.dart';
import 'package:flutter/material.dart';

class IncidentListPage extends StatefulWidget {
  @override
  _IncidentListPage createState() => _IncidentListPage();
}

class _IncidentListPage extends State<IncidentListPage> {
  
  IncidentListViewModel _incidentListVM = IncidentListViewModel();
  List<IncidentViewModel> _incidents = List<IncidentViewModel>();

  bool _isSignedIn = false; 

  @override
  void initState() {
    super.initState();
    _populateAllIncidents();
  }

  void _populateAllIncidents() async {
    
    final incidents = await _incidentListVM.getAllIncidents();
    setState(() {
      _incidents = incidents;
    });

  }

  void _navigateToRegisterPage(BuildContext context) async {
    final bool isRegisted = await AppNavigator.navigateToRegisterPage(context);
    if(isRegisted) {
      AppNavigator.navigateToLoginPage(context);
    }
  }

  void _navigateToLoginPage(BuildContext context) async {
    final bool isLoggedIn = await AppNavigator.navigateToLoginPage(context);
    if(isLoggedIn) {
      // Goto incidents page.
    }
  }

  void _navigateToMyIncidentsPage(BuildContext context) {
     Navigator.push(context, MaterialPageRoute(
      builder: (context) => MyIncidentsPage() 
    ));
  }

  void _navigateToAddIncidentsPage(BuildContext context) async {
      bool incidentAdded = await AppNavigator.navigateToAddIncidentPage(context);
      if(incidentAdded) {
        _populateAllIncidents();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Latest Incidents")),
        drawer: Drawer(
            child: ListView(
          children: [
            DrawerHeader(child: Text("Menu")),
            ListTile(title: Text("Home")),
            ListTile(
                    title: Text("My Incidents"),
                    onTap: () async {
                        _navigateToMyIncidentsPage(context);
                    }),
                ListTile(
                    title: Text("Add Incident"),
                    onTap: () {
                      _navigateToAddIncidentsPage(context);
                    },
                  ),
                ListTile(
                    title: Text("Login"),
                    onTap: () {
                      _navigateToLoginPage(context);
                    }),
                ListTile(
                    title: Text("Register"),
                    onTap: () {
                      _navigateToRegisterPage(context);
                    }),
                ListTile(
                    title: Text("Logout"),
                    onTap: () async {


                    })
          ],
        )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _incidents.length > 0 ? IncidentList(_incidents) : EmptyOrNoItems(message: "No incidents found."),
        ));
  }
}
