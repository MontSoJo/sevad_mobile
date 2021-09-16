import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Text('Laura Bosch Gonzalez', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
                //backgroundImage: NetworkImage(''), radius: 25.0
                backgroundImage: AssetImage('assets/12345678Z.jpg'),
                radius: 25.0),
          )
        ],
      ),
      //   title: Text(''),
      //   backgroundColor: Colors.white,
      //   shadowColor: Colors.black,
      // ),
      body: Center(child: Text('Soc el mapa, tot i que encara no ho sembli')),

      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.white,
        // focusColor: Colors.black,
        child: Icon(
          Icons.arrow_back,
          //color: Colors.black,
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'list');
          //Navigator.pop(context);
        },
      ),
    );
  }
}