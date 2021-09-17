import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sevad_mobile/models/visit_model.dart';
import 'package:http/http.dart' as http;

class VisitsService extends ChangeNotifier {
  final String _baseUrl = 'http://192.168.0.36:8080';

  final List<Visit> visits = [];

  bool isLoading = true;

  VisitsService() {
    this.loadVisits();
  }

  Future<List<Visit>> loadVisits() async {
    this.isLoading = true;
    notifyListeners();

    //final url = Uri.http(_baseUrl, '/visits/2021-09-17');
    //final resp = await http.get(url);
    final resp =
        await http.get(Uri.parse("http://192.168.0.36:8080/visits/2021-09-16"));
    //print('resp.body');
    //print(resp.body);

    //final Map<String, dynamic> visitsMap = json.decode(resp.body);
    final visitsMap = json.decode(resp.body);
    //final Map visitsMap = json.decode(resp.body);
    //print('visitsMap');
    //print(visitsMap);

    //visitsMap.forEach(visit in values) {
    visitsMap.forEach((value) {
      final tempVisit = Visit.fromMap(value);
      this.visits.add(tempVisit);
    });

    //print(this.visits[0].id); //[0][valuerObjectId]);
    //print(this.visits[1].id); //[0][valuerObjectId]);

    this.isLoading = false;
    notifyListeners();

    return this.visits;
  }

  //TODO: hacer el fetch de visitas
}
