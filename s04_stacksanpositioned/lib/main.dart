import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Scaffold(
        body: MyHome(),
      )
    );
  }
}
class MyHome extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Positioned(
              top: -20,
              left: -20,
              child: Icon(
                Icons.shopping_cart,
                size: 40,
                color: Colors.green,
              ),
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
