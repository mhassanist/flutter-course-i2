import 'package:flutter/material.dart';
/*
void main(){
  runApp(app)
}*/

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text("Title Here"),
      centerTitle: true,
    ),
    body: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                    color: Colors.red,
                    child: Text(
                      "Text 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ))),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Icon(
                  Icons.event,
                  size: 50,
                ),
              ),
            ),
            Expanded(
                child: Container(
                    color: Colors.cyan,
                    child: Text("Text 2",
                        style:
                        TextStyle(fontSize: 22, color: Colors.white))))
          ],
        )),
  ),
));

/*
Image(
  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
)
*/
