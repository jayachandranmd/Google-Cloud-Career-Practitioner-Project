import 'dart:math';

import 'package:chargeio/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/textstyle.dart';
import 'home_page.dart';

class ExistingUser extends StatelessWidget {
  ExistingUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: hpad20 + hpad20,
        child: SingleChildScrollView(
          child: Column(
            children: [
              sBoxH30,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Existing Users',
                    style: TextStyle(fontSize: 25, color: blue)),
                Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                      color: blue, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Edit',
                          style: loginButton,
                        ),
                        Icon(
                          Icons.edit,
                          color: white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                )
              ]),
              sBoxH60,
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: LinearProgressIndicator());
                    }
                    return _buildTable(context, snapshot.data!.docs);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTable(BuildContext context, List<DocumentSnapshot> snapshot) {
  return DataTable(
    columnSpacing: 30,
    columns: [
      DataColumn(
          label: Text('Name', style: TextStyle(fontSize: 20, color: blue))),
      DataColumn(
          label: Text('Email', style: TextStyle(fontSize: 20, color: blue))),
      DataColumn(
          label: Text('Access Control',
              style: TextStyle(fontSize: 20, color: blue))),
      DataColumn(
          label: Text('Password', style: TextStyle(fontSize: 20, color: blue))),
    ],
    rows: snapshot
        .map((data) => DataRow(cells: [
              DataCell(Text(data['name'])),
              DataCell(Text(data['email'])),
              DataCell(Text(data['accessControl'])),
              DataCell(Text(data['password']))
            ]))
        .toList(),
  );
}
