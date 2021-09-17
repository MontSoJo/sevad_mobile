// To parse this JSON data, do
//
//     final visit = visitFromMap(jsonString);

import 'dart:convert';

class Visit {
  Visit({
    required this.id,
    required this.valued,
    required this.visitDate,
    required this.proceedingObjectId,
    required this.valuerObjectId,
    required this.v,
  });

  String id;
  String valued;
  DateTime visitDate;
  ProceedingObjectId proceedingObjectId;
  String valuerObjectId;
  int v;

  factory Visit.fromJson(String str) => Visit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Visit.fromMap(Map<String, dynamic> json) => Visit(
        id: json["_id"],
        valued: json["valued"],
        visitDate: DateTime.parse(json["visit_date"]),
        proceedingObjectId:
            ProceedingObjectId.fromMap(json["proceeding_ObjectId"]),
        valuerObjectId: json["valuer_ObjectId"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "valued": valued,
        "visit_date": visitDate.toIso8601String(),
        "proceeding_ObjectId": proceedingObjectId.toMap(),
        "valuer_ObjectId": valuerObjectId,
        "__v": v,
      };
}

class ProceedingObjectId {
  ProceedingObjectId({
    required this.id,
    required this.name,
    required this.phoneNumbers,
    required this.address,
  });

  String id;
  Name name;
  List<String> phoneNumbers;
  Address address;

  factory ProceedingObjectId.fromJson(String str) =>
      ProceedingObjectId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProceedingObjectId.fromMap(Map<String, dynamic> json) =>
      ProceedingObjectId(
        id: json["_id"],
        name: Name.fromMap(json["name"]),
        phoneNumbers: List<String>.from(json["phone_numbers"].map((x) => x)),
        address: Address.fromMap(json["address"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name.toMap(),
        "phone_numbers": List<dynamic>.from(phoneNumbers.map((x) => x)),
        "address": address.toMap(),
      };
}

class Address {
  Address({
    required this.street,
    required this.postcode,
  });

  String street;
  String postcode;

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        street: json["street"],
        postcode: json["postcode"],
      );

  Map<String, dynamic> toMap() => {
        "street": street,
        "postcode": postcode,
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
