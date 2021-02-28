
import 'package:city_care/pages/add_incidents_page.dart';
import 'package:city_care/pages/login_page.dart';
import 'package:city_care/pages/my_incidents_page.dart';
import 'package:city_care/pages/register_page.dart';
import 'package:flutter/material.dart';

class IncidentListPage extends StatefulWidget {
  @override
  _IncidentListPage createState() => _IncidentListPage();
}

class _IncidentListPage extends State<IncidentListPage> {
  
  bool _isSignedIn = false; 

  @override
  void initState() {
    super.initState();
    _populateAllIncidents();
  }

  void _populateAllIncidents() async {
    
  }

  void _navigateToRegisterPage(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => RegisterPage(), fullscreenDialog: true 
    ));
  }

  void _navigateToLoginPage(BuildContext context) async {
     Navigator.push(context, MaterialPageRoute(
      builder: (context) => LoginPage(), fullscreenDialog: true 
    ));
  }

  void _navigateToMyIncidentsPage(BuildContext context) {
     Navigator.push(context, MaterialPageRoute(
      builder: (context) => MyIncidentsPage() 
    ));
  }

  void _navigateToAddIncidentsPage(BuildContext context) async {
      Navigator.push(context, MaterialPageRoute(
      builder: (context) => AddIncidentsPage()
    ));
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
          child: Text(""),
        ));
  }
}
