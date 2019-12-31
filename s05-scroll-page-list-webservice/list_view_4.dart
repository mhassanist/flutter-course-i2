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
        body: ListView(
          children: <Widget>[
            Card(child: ListTile(title: Text('One-line ListTile'))),
            Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('One-line with leading widget'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('One-line with trailing widget'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('One-line with both widgets'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('One-line dense ListTile'),
                dense: true,
              ),
            ),
            Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Two-line ListTile'),
                subtitle: Text('Here is a second line'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            InkWell(
              onTap: (){
                print("inkwell clicked");
              },
              child: Card(

                child: ListTile(
                  onTap: (){print("list tile clicked");},
                  leading: InkWell(onTap: (){print("leading  tile clicked");},child: FlutterLogo(size: 72.0)),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'
                  ),
                  trailing: InkWell(onTap: (){print("triling tile clicked");},child: Icon(Icons.more_vert)),
                  isThreeLine: true,

                ),
              ),
            ),
          ],
        )


        ,
      ),
    );
  }

}