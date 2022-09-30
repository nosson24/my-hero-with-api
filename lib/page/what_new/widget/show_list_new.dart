import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_project/style/main_app_color.dart';

class ShowListNew extends StatelessWidget {
  const ShowListNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("WhatNewList").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          if (!snapshots.hasData) {
            return const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshots.data?.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot documentSnapshot = snapshots.data!.docs[index];
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                  right: 10,
                  left: 10,
                ),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        color: MainAppColor.introP2Color,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: MainAppColor.normalColor, width: 2)),
                    width: 54,
                    height: 54,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        documentSnapshot['iconPath'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  title: Text(
                    documentSnapshot['title'],
                    style: MainFontstyle.mainFont1,
                  ),
                  subtitle: Text(
                    documentSnapshot['description'],
                    style: MainFontstyle.mainFont1,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
