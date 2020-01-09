

import 'dart:io';

import 'package:coursesproject/bloc/course_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/*
* {"title": "jan20 2 course sample",
* "description": "desc",
* "lang":"english",
* "image": "http://example1.com/",
* "show_in_list": true,
* "show_in_list": true,
	"access": "public"
}
* */
class CreateCourse extends StatefulWidget {
  @override
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  File _image;
  TextEditingController _titleConteoller = new TextEditingController();
  TextEditingController _descConteoller = new TextEditingController();
  TextEditingController _langConteoller = new TextEditingController();
  TextEditingController _imageConteoller = new TextEditingController();
CourseBloc courseBloc = new CourseBloc();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      _imageConteoller.text = _image.path;
    });
  }

  @override
  void initState() {
    _titleConteoller.text = "Course Title";
    _descConteoller.text = "Course Description";
    _langConteoller.text = "Course Lang";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _titleConteoller,
              ),
              TextField(
                controller: _descConteoller,
              ), TextField(
                controller: _langConteoller,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: _imageConteoller,
                    ),
                  ),
                  RaisedButton(
                    child: Text("Choose"),
                      onPressed: getImage,

                  ),
                ],
              ),
              RaisedButton(
                child: Text("Submit"),
                onPressed: (){
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
