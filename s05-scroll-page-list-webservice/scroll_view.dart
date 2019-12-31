import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMIApp());

class BMIApp extends StatefulWidget{
  @override
  _BMIAppState createState() => _BMIAppState();
}

class _BMIAppState extends State<BMIApp> {
  TextEditingController controllerHeight = TextEditingController();
  TextEditingController controllerWeight = TextEditingController();
  var height;
  var weight;
  var result;
  @override
  Widget build(BuildContext context) {

    Widget imageSection = Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://www.codester.com/static/uploads/items/9107/icon.png"),
          backgroundColor: Colors.lightGreen,
          radius: 50,
        ),
      ),
    );
    Widget heightSection = Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: controllerHeight,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red
                )
            ),
            hintText: "Enter Your Height In cm",
            labelText: "Height",
            labelStyle: TextStyle(color: Colors.green,fontSize: 19),
            prefixIcon: Icon(Icons.accessibility),
            errorStyle: TextStyle(color: Colors.red)
        ),
      ),
    );
    Widget weightSection = Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: controllerWeight,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red
                )
            ),
            labelText: "Weight",
            labelStyle: TextStyle(color: Colors.green,fontSize: 19),
            prefixIcon: Icon(Icons.accessibility_new),
            errorStyle: TextStyle(color: Colors.red)
        ),
      ),
    );
    Widget buttonSection = Container(
      child: Center(
        child: RaisedButton(
          padding: const EdgeInsets.all(10),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: (){
            if (weight < height){
              height = int.parse(controllerHeight.text);
              weight = int.parse(controllerWeight.text);

            }
            setState(() {
              result = (weight/(height*height));
            });
          },
          child: Text("Calculate",
              style: TextStyle(fontSize: 14)
          ),
        ),

      ),
    );
    Widget resultSection = Container(
      width: 600,
      height: 250,
      child: Center(
          child: Text(result.toString(),
            style: TextStyle(
              fontSize: 25,
            ),)),
    );

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("BMI Calculator")),
          ),
          body: Column(
            children: <Widget>[
              imageSection,
              heightSection,
              weightSection,
              buttonSection,
              resultSection,
            ],
          ),
        ));
  }
}