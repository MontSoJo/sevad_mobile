import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
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
      body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
        _cardVisit(),
        SizedBox(height: 10),
        _cardVisit(),
        SizedBox(height: 10),
        _cardVisit(),
        SizedBox(height: 10),
      ]),

      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.white,
        // focusColor: Colors.black,
        child: Icon(
          Icons.arrow_back,
          //color: Colors.black,
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'map');
          //Navigator.pop(context);
        },
      ),
    );
  }

  Widget _cardVisit() {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(children: <Widget>[
          Text('Nom i Cognoms de la persona'),
          SizedBox(height: 5),
          Text('Adreça'),
          SizedBox(height: 5),
          Text('Telèfon'),
          SizedBox(height: 5),
        ]));
  }
}
