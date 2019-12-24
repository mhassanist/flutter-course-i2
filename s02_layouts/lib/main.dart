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
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Product Name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "product description move little text \n j asdkjfgaskdjfghdsf\nsdkfj hlskdfh",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
            )
          ],
        ),
      ),
    ));

/*
Image(
  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
)
*/
