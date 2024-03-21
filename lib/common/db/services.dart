// Create a new user with a first and last name
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final service = <String, dynamic>{
  "first": "Ada",
  "last": "Lovelace",
  "born": 1816,
  'id': 1,
};

void addService() {
  FirebaseFirestore.instance.collection('services').add(service).then((value) {
    debugPrint(value.id);
  });
}

void readService() {
  FirebaseFirestore.instance.collection('services').get().then((value) {
    for (var element in value.docs) {
      debugPrint(element.data().toString());
    }
  });
}
