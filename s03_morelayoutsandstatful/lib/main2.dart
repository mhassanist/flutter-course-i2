import 'package:flutter/material.dart';
import 'package:s03morelayoutsandstatful/home_page.dart';
import 'package:s03morelayoutsandstatful/place_details.dart';

void main() {
  //runApp(MyApp());
  //get data from web
  PlaceDetails p = new PlaceDetails(/*datafromweb*/);
  p.mainText =  'Oeschinen Lake Campground';
  p.subText = 'Kandersteg, Switzerland';

  runApp(
      MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter layout demo'),
            ),
            body: HomePage(p),

          )
      ));
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