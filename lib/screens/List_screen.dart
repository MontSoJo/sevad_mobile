import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sevad_mobile/widgets/widgets.dart';
import 'package:sevad_mobile/services/services.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final visitsService = Provider.of<VisitsService>(context);
    //final valuerService = Provider.of<ValuerService>(context);

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
      body: ListView.builder(
          itemCount: visitsService.visits.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                const int dummy = 1;
              },
              child: VisitCard(
                visit: visitsService.visits[index],
              ))),
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
}
