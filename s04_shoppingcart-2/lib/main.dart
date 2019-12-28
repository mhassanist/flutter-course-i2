import 'package:flutter/material.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int counter = 0;

  _updateCartCount(int count){
    setState(() {
      this.counter = count;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 150.0,
                  width: 30.0,
                  child: new Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      counter == 0
                          ? new Container()
                          : new Positioned(
                          child: new Stack(
                            children: <Widget>[
                              new Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.green[800]),
                              new Positioned(
                                  top: 3.0,
                                  right: 3.0,
                                  left: 3.0,
                                  bottom: 3.0,
                                  child: new Center(
                                    child: new Text(
                                      counter.toString(),
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )),
                    ],
                  )),
            )
          ],
        ),
        body:SecondScreen(_updateCartCount)
    );
  }
}

class SecondScreen extends StatefulWidget {

  var myupdateListCallback;

  SecondScreen(updateListCallback){
    myupdateListCallback = updateListCallback;
  }

  @override
  // If you want to send the function to the state class
  //_SecondScreenState createState() => _SecondScreenState(myupdateListCallback);
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // If you want to send the function to the state class
  /*  var myUpdateListCallback;
  _SecondScreenState(myUpdateListCallback){
    this.myUpdateListCallback = myUpdateListCallback;
  }
*/
  var list = [];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'SIMPLE ITEM TEST',
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                list.add("Item Example");
                //myUpdateListCallback(list.length);
                widget.myupdateListCallback(list.length);
              });
            },
            child: Text(
              'ADD TO CART',
            ),
          ),
        ],
      ),
    );
  }
}




