import 'package:flutter/material.dart';
/*
import 'package:provider/provider.dart';
import 'package:sevad_mobile/providers/visit_form_provider.dart';

import 'package:sevad_mobile/models/models.dart';

import 'package:sevad_mobile/services/services.dart';
import 'package:sevad_mobile/widgets/widgets.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final visitsService = Provider.of<VisitsService>(context);

    return ChangeNotifierProvider(
      create: (_) => VisitFormProvider(visitsService.selectedVisit),
      child: _VisitScreenBody(visitService: visitsService),
    );
  }
}
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
      body: ListView.builder(
          itemCount = visitsService.visits.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {},
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
  Widget VisitCard() {
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

class _VisitScreenBody extends StatelessWidget {
  const _VisitScreenBody({
    Key? key,
    required this.visitService,
  }) : super(key: key);

  final VisitsService visitService;

  @override
  Widget build(BuildContext context) {
    final visitForm = Provider.of<VisitFormProvider>(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Column,
    ));
  }
}
*/