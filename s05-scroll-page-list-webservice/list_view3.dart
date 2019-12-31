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
            itemBuilder: (BuildContext context, int index) {
              return _builditems(index);
            }

        )
        ,
      ),
    );
  }

  Widget _builditems(int index) {
    return Container(
      height: 100,
      color: index%2==0 ? Colors.red : Colors.green,
    );
  }
}