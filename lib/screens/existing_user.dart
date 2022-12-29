import 'dart:math';

import 'package:chargeio/utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/textstyle.dart';
import 'home_page.dart';

class ExistingUser extends StatelessWidget {
  ExistingUser({Key? key}) : super(key: key);

  final DataTableSource data = ExistingUserData();

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
                Text('Existing User',
                    style: TextStyle(fontSize: 25, color: blue)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Back',
                            style: loginButton,
                          ),
                        ),
                      ),
                    ),
                    sBoxW30,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(20)),
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
                      ),
                    ),
                  ],
                )
              ]),
              sBoxH60,
              Center(
                child: PaginatedDataTable(
                  source: data,
                  columns: [
                    DataColumn(
                        label: Text('Name',
                            style: TextStyle(fontSize: 20, color: blue))),
                    DataColumn(
                        label: Text('Email',
                            style: TextStyle(fontSize: 20, color: blue))),
                    DataColumn(
                        label: Text('Password',
                            style: TextStyle(fontSize: 20, color: blue))),
                  ],
                  columnSpacing: 400,
                  horizontalMargin: 200,
                  arrowHeadColor: blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExistingUserData extends DataTableSource {
  final List<Map<String, dynamic>> data = List.generate(
      15,
      (index) => {
            'name': "Name $index",
            'email': "Email $index",
            'password': Random().nextInt(100000),
          });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index]['name'].toString())),
      DataCell(Text(data[index]['email'].toString())),
      DataCell(Text(data[index]['password'].toString())),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}


/*
Table(
border: TableBorder.all(color: grey),
columnWidths: const {
0: FractionColumnWidth(0.40),
1: FractionColumnWidth(0.40),
2: FractionColumnWidth(0.40),
},
children: [
TableRow(
children: [
Text("Name",style: TextStyle(color: blue, fontSize: 24),),
Text("Email",style: TextStyle(color: blue, fontSize: 24),),
Text("Password",style: TextStyle(color: blue, fontSize: 24),),
]
)
],
),*/
