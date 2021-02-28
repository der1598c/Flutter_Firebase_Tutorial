import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum PhotoOptions { camera, library }

class AddIncidentsPage extends StatefulWidget {
  @override
  _AddIncidentsPage createState() => _AddIncidentsPage();
}

class _AddIncidentsPage extends State<AddIncidentsPage> {
  
  File _image;
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController(); 
  final _descriptionController = TextEditingController(); 

  void _selectPhotoFromPhotoLibrary() async {
    
  }

  void _selectPhotoFromCamera() async {
   
  }

  void _optionSelected(PhotoOptions option) {
    switch (option) {
      case PhotoOptions.camera:
        _selectPhotoFromCamera();
        break;
      case PhotoOptions.library:
        _selectPhotoFromPhotoLibrary();
        break;
    }
  }

  void _saveIncident(BuildContext context) async {

    // validate the form
    if (_formKey.currentState.validate()) {
    
    }

  }

  Widget _buildLoadingWidget() {
    return Text("Loading...");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Incident"), 
          
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(children: [
                  SizedBox(
                    child: _image == null ? Image.asset("assets/images/city_care.jpg") : Image.asset(_image.path), 
                    width: 300, 
                    height: 300
                  ),
                 Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: FlatButton(
                      color: Colors.blue,
                      onPressed: () {},
                      textColor: Colors.white,
                      child: PopupMenuButton<PhotoOptions>(
                        child: Text("Add Photo"),
                        onSelected: _optionSelected,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text("Take a picture"),
                            value: PhotoOptions.camera,
                          ),
                          PopupMenuItem(
                              child: Text("Select from photo library"),
                              value: PhotoOptions.library)
                        ],
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _titleController, 
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Title is required!";
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: "Enter incident title"),
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Description is required!";
                      }
                      return null;
                    },
                    maxLines: null,
                    decoration:
                        InputDecoration(hintText: "Enter incident description"),
                  ),
                  FlatButton(
                    child: Text("Submit"),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      _saveIncident(context);
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                  ), 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Message"),
                  ), 
                  _buildLoadingWidget() 
                ]),
              ),
            ),
          ),
        ));
  }
}
