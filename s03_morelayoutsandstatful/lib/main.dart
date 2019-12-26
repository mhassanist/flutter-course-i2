import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  TextEditingController name = TextEditingController();
  int counter = 0;
  bool counterSet = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter layout demo'),
          ),
          body: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
              ),
            ),
            RaisedButton(
              onPressed: (){
                if(!counterSet){
                  counter = int.parse(name.text);
                  counterSet = true;
                }
                  setState(() {
                      counter++;
                  });
              },
              child: Text("Say Welcome"),
            ),
            Text(counter.toString())
          ],
          ),

        )
    );

  }
}
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout demo',
        home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
          body: HomePage(),

        )
    );
  }
}*/