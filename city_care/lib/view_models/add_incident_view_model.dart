import 'dart:io';

import 'package:city_care/models/incident.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import 'incident_view_state.dart';

class AddIncidentViewModel extends ChangeNotifier {

  String message = "";

  Future<bool> saveIncident(IncidentViewState incidentVS) async {
    
    bool isSaved = false;
    final incident = Incident.fromIncidentViewState(incidentVS);

    try {
      FirebaseFirestore.instance.collection("incidents")
        .add(incident.toMap());
      isSaved = true;
    } catch(e) {
      message = "Unable to save incident.";
    }

    notifyListeners();
    return isSaved;

  }

  Future<String> uploadFile(File file) async {
    
    String downloadedURL;

    final uuid = Uuid();
    final filePath = "/images/${uuid.v4()}.jpg";
    final storage = FirebaseStorage.instance.ref(filePath);
    final uploadTask = await storage.putFile(file);

    if(uploadTask.state == TaskState.success) {
      downloadedURL = await FirebaseStorage.instance.ref(filePath).getDownloadURL();
    }

    return downloadedURL;
  }

}