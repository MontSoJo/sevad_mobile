import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
      body: FlutterMap(
        options: MapOptions(
            center: new LatLng(41.42044, 2.20285), minZoom: 10.0, zoom: 18.0),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(markers: [
            Marker(
                width: 50.0,
                height: 50.0,
                point: LatLng(41.42044, 2.20285),
                builder: (context) => Container(
                    child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.blue,
                        iconSize: 50.0,
                        onPressed: () {
                          print('Marker tapped');
                        }))),
          ]),
        ],
      ),
/*
        Center(
        child: Text('Soc el mapa, tot i que encara no ho sembli. Apa Adeú....'),
        flutter_map
      ),
*/
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
