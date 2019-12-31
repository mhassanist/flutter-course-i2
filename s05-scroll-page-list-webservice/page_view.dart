import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller = PageController(initialPage: 0, keepPage: false);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DraggableScrollableSheet'),
        ),
        body: PageView(
          controller: _controller,
          scrollDirection: Axis.horizontal,

          children: <Widget>[
            Container(
              color: Colors.pink,
            ),
            Container(
              child: RaisedButton(
                child:Text("Go to page 3"),
                onPressed: (){
                  setState(() {
                    _controller.animateToPage(
                        2,duration: const Duration(milliseconds: 1400),curve: Curves.easeInOut);

                  });
                },
              ),
              color: Colors.cyan,
            ),
            Container(
              color: Colors.deepPurple,
            ),
          ],
        )
        ,
      ),
    );
  }
}