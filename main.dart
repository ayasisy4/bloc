import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'GlobalBloc.dart';
import 'blocProvider.dart';
import 'firebae_auth.dart';
import 'dataService.dart';
void main() => runApp(
      BlocProvider(
        bloc: GlobalBloc(),
        child:MaterialApp(home: HomePage()),
      ),
    );


class HomePage extends StatefulWidget {
 // const HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}



class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

final GlobalBloc bloc = BlocProvider.of<GlobalBloc>(context);

    return new Scaffold(
     
      appBar: AppBar(
        title: Text("Home Page"),
      ),

drawer: new Drawer(child:
      StreamBuilder<UnmodifiableListView>(
        stream: bloc.placename,
        builder:(_,AsyncSnapshot<UnmodifiableListView> placename){
              if (!placename.hasData){
        return Center(child: CircularProgressIndicator());
      }
      else{
         return ListView.builder(
          itemCount: placename.data?.length,
          itemBuilder:((BuildContext context,int index){
               return StreamBuilder<UnmodifiableListView>(
                stream: bloc.placeid,
                builder:(_,AsyncSnapshot<UnmodifiableListView> placeid){
                return ListTile(title:Text(placename.data[index]),onTap:(){
             
                  }                );

                 
                }
                );
                   }
                    )
                  );   
      }
        }
                    
      )
),         

  body:Column(
    children: <Widget>[
      Container(
        height:500.0,
        
      child:StreamBuilder(
        stream: bloc.order,
        builder:(_,AsyncSnapshot order){
              if (!order.hasData){
        return Center(child: CircularProgressIndicator());
      }
      else{
         return ListView.builder(
          itemCount: order.data.length,
          itemBuilder:((BuildContext context,int index){
            print(order.data?.length.toString());
                return ListTile(title:Text(order.data[index]) );
       }
       ) 
         );
      } 
        } 
       )), ] 
  ),
     ); }
}
                 
               

  // children:<Widget>[ StreamBuilder<QuerySnapshot>(
  //   stream: Firestore.instance.collection("places").snapshots(),
  //   builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
      
      
  //     if (!snapshot.hasData){
  //       return Center(child: CircularProgressIndicator());
  //     }
  //     else{
  //       return Column(
  //          children:<Widget>
  //        [
  //          TabBar( isScrollable: true,
  //             tabs: new List.generate(snapshot.data.documents.length, (index) {
  //                   return new Tab(child: Text(snapshot.data.documents[index]['name'].toString().toUpperCase()));
                    
  //                     //String f=snapshot.data.documents[index]["Place"].toString();
                      
                     
                    
                            
  //                              // print( Firestore.instance.collection("Places").document(f).collection("order 1").document('order 1').snapshots().toString());
                                     
  //                           }       
  //         ) 
  //         ),

  //         TabBarView(
  //         children: <Widget>[
  //           Icon(Icons.directions_car),
  //           Icon(Icons.directions_transit),
  //           Icon(Icons.directions_bike),
  //         ],
  //       )
  //       ],
  //       );}
    
  
  //   })
  // ]) 
  // );
  
