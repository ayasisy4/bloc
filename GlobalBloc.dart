import 'dart:async';
import'package:rxdart/rxdart.dart';
import 'blocProvider.dart';
import './dataService.dart';
import 'dart:collection';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class GlobalBloc extends BlocBase{
  GlobalBloc() { _dataServices.getplaces().then(_sinkplace);
  print('this is constructoor');
  }

  DataServices _dataServices = DataServices();
BehaviorSubject<UnmodifiableListView> _placeController = BehaviorSubject<UnmodifiableListView>();
Observable<UnmodifiableListView> get placename=>_placeController.stream;

BehaviorSubject<UnmodifiableListView> _place1Controller = BehaviorSubject<UnmodifiableListView>();
Observable<UnmodifiableListView> get placeid=>_place1Controller.stream;
  

BehaviorSubject<List<dynamic>> _orderController = BehaviorSubject<List<dynamic>>();
Observable<List<dynamic>> get order=>_orderController.stream;

void _sinkplace (QuerySnapshot p){
  List placesname=List();
  List placesid=List();
p.documents.forEach((DocumentSnapshot doc){
 placesname.add(doc.data['name']);
 placesid.add(doc.documentID);

});
_placeController.sink.add(UnmodifiableListView(placesname));
_place1Controller.sink.add(UnmodifiableListView(placesid));

}

void sinksubs(String uid){
    _dataServices.getSubsInplace(uid).then((List<dynamic> subslist) {
      _orderController.sink.add(subslist);

      } );
      }
      

@override
  void dispose() {
    _placeController.close();
    _orderController.close();
  }
}
