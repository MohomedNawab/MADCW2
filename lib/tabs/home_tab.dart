import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryapp/widget/custom_action_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final CollectionReference _productRef = 
      FirebaseFirestore.instance.collection("001");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _productRef.get(),
            builder: (context,snapshot){
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              if(snapshot.connectionState == ConnectionState.done){
                return ListView(
                  children: snapshot.data!.docs.map((document) {
                    Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                    return Text("Name:"
                        " ${data['name']}"
                    );
                  }).toList(),
                );
              }

              //Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          CustomActionBar(
            title: "Home",
            hasBackArrow: false,
          )
        ],
      ),
    );
  }
}
