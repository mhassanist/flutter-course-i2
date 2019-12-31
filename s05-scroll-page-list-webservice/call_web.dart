import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List ps=[];


  _getData() async {
    var url = 'http://ec2-18-189-170-234.us-east-2.compute.amazonaws.com/upload/products.php';
    var response = await http.get(url);
    List<dynamic> producs = jsonDecode(response.body);

    setState(() {
      this.ps= producs;

    });

    print(producs[0]['name']);
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('DraggableScrollableSheet'),
            ),
            body: Container(
              child: Text(ps[0]['name']),
            )
        )
    );
  }
}