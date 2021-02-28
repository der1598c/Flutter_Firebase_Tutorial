
import 'package:city_care/models/incident.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'incident_list_view_model.dart';

class MyIncidentListViewModel {

  Future<List<IncidentViewModel>> getMyIncidents() async {

    final userId = FirebaseAuth.instance.currentUser.uid; 
    print("userId: $userId");

    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("incidents")
      .where("userId", isEqualTo: userId)
      .orderBy("incidentDate", descending: true)
      .get(); 

    final incidents = snapshot.docs.map((doc) => Incident.fromDocument(doc)).toList();
    print("incidents length: ${incidents.length}");
    return  incidents.map((incident) => IncidentViewModel(incident: incident)).toList();

  }

}