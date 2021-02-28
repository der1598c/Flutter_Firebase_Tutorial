

import 'package:flutter/material.dart';

class IncidentList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) {
        
        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("", fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12, fontWeight: FontWeight.w400)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(""),
              )
            ],
          ), 
        );
      },
    );
  }
}