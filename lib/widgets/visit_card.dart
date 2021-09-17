import 'package:flutter/material.dart';
import 'package:sevad_mobile/models/models.dart';

class VisitCard extends StatelessWidget {
  final Visit visit;

  const VisitCard({Key? key, required this.visit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(children: <Widget>[
          Text(visit.visitDate
              .toIso8601String()
              .substring(11, 16)), //('Adreça'),
          SizedBox(height: 5),
          Text(visit.proceedingObjectId.name.last.toString() +
              ", " +
              visit.proceedingObjectId.name.first
                  .toString()), //Text('Nom i Cognoms de la persona'),
          SizedBox(height: 5),
          //2021-09-17T09:00:00.000Z
          Text(visit.proceedingObjectId.address.postcode +
              ", " +
              visit.proceedingObjectId.address.street), //('Adreça'),
          SizedBox(height: 5),
          Text(visit.proceedingObjectId.phoneNumbers[0]), //Text('Telèfon'),
          SizedBox(height: 5),
          Text("Lat(" +
              visit.proceedingObjectId.location.coordinates[0].toString() +
              ") - Long(" +
              visit.proceedingObjectId.location.coordinates[0].toString() +
              ")"),
          SizedBox(height: 5),
        ]));
  }
}
