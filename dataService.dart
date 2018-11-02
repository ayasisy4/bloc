import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DataServices{

Future<QuerySnapshot> getSubsInplace1(String uid) async {
      QuerySnapshot user= await Firestore.instance.collection('users').where('place', isEqualTo: uid).getDocuments();
      return user;
}
          
Future<List> getSubsInplace( String place) async {
    List<String> userids = List();
    QuerySnapshot usersubs =
        await Firestore.instance.collection('tempSubs').getDocuments();
    QuerySnapshot userid = await Firestore.instance
        .collection('users')
        .where('place', isEqualTo: place)
        .getDocuments();
        print(userid);
    userid.documents.forEach((
      DocumentSnapshot doc,
    ) {
      usersubs.documents.forEach((DocumentSnapshot doc1) {
        if (doc.documentID == doc1.documentID) {
          userids.add(doc.documentID);
          
        }
      });
    });
    print('hellllo $userids');
    return userids;
  }

Future<QuerySnapshot> getplaces() async{
  List<String> temp=List();
    QuerySnapshot place= await  Firestore.instance.collection('places').getDocuments();
    return place;
}}