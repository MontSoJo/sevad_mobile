// To parse this JSON data, do
//
//     final valuer = valuerFromMap(jsonString);

import 'dart:convert';

class Valuer {
  Valuer({
    required this.id,
    this.postcodes,
    required this.valuerId,
    required this.name,
    required this.v,
  });

  String id;
  List<String>? postcodes;
  String valuerId;
  Name name;
  int v;

  factory Valuer.fromJson(String str) => Valuer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Valuer.fromMap(Map<String, dynamic> json) => Valuer(
        id: json["_id"],
        postcodes: List<String>.from(json["postcodes"].map((x) => x)),
        valuerId: json["valuer_id"],
        name: Name.fromMap(json["name"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "postcodes": List<dynamic>.from(postcodes!.map((x) => x)),
        "valuer_id": valuerId,
        "name": name.toMap(),
        "__v": v,
      };
}

class Name {
  Name({
    required this.first,
    required this.last,
  });

  String first;
  String last;

  factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toMap() => {
        "first": first,
        "last": last,
      };
}
