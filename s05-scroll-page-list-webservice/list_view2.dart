import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DraggableScrollableSheet'),
        ),
        body: ListView.builder(
            itemCount: 50,
            itemBuilder: _buildlist
        )
        ,
      ),
    );
  }


  Widget _buildlist(BuildContext context, int index) {
   //return Item UI Widget here based on position
    if (index == 0) {
      return Text("Hello");
    }
    else {
      return Container(height: 100,);
    }
  }
}