import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  List list;
  int index;
  Details({this.list, this.index});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Text("${widget.list[widget.index]['Patentee_Name']}")),
      ),
      body: FutureBuilder<List>(
          future: getData(),
          builder: (ctx, ss) {
            if (ss.hasError) {
              print('error');
            }
            if (ss.hasData) {
              List<dynamic> list3 = List<dynamic>();
              for (int i = 0; i < ss.data.length; i++) {
                if (int.parse(ss.data[i]['Patentee_ID']) ==
                    int.parse(widget.list[widget.index]['Patentee_ID'])) {
                  list3.add(ss.data[i]);
                }
              }
              return Items(list2: list3);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<List> getData() async {
    final response = await http
        .get("https://patent101.000webhostapp.com/PatentOffice/getPatents.php");
    // print(json.decode(response.body));
    return json.decode(response.body);
  }
}

class Items extends StatelessWidget {
  int cPatent_ID = 0;
  int cApplication_Office_ID = 0;
  int cExaminer_ID = 0;
  String cFees_Paid = "";
  String cRenewal_Status = "";
  List list2;
  Items({this.list2});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list2 == null ? 0 : list2.length,
        itemBuilder: (ctx, i) {
          return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Card(
                            color: Colors.grey.shade400,
                            child: Container(
                              child: Center(child: Text("${i + 1}")),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                            color: Colors.grey.shade400,
                            child: Container(
                              child: Center(child: Text('Title')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child: Center(child: Text(list2[i]['Title'])),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                            color: Colors.grey.shade400,
                            child: Container(
                              child: Center(child: Text('Subject')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child: Center(child: Text(list2[i]['Subject'])),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                            color: Colors.grey.shade400,
                            child: Container(
                              child: Center(child: Text('Inventor')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child: Center(child: Text(list2[i]['Inventor'])),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                            color: Colors.grey.shade400,
                            child: Container(
                              child: Center(child: Text('Expense in USD')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child: Center(child: Text(list2[i]['Expense_in_US'])),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                            color: Colors.grey.shade400,
                            child: Container(
                              child: Center(child: Text('Filling Language')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child:
                              Center(child: Text(list2[i]['Filling_Language'])),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                            color: Colors.grey.shade400,
                            child: Container(
                              child: Center(child: Text('Patent Examiner ID')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child: Center(
                              child: Text(list2[i]['Patent_Examiner_ID'])),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                            color: Colors.grey.shade400,
                            child: Container(
                              child: Center(child: Text('Date of Grant')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child: Center(child: Text(list2[i]['Date_of_Grant'])),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                            color: Colors.grey.shade400,
                            child: Container(
                              child: Center(child: Text('Date of Expiry')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child:
                              Center(child: Text(list2[i]['Date_of_Expiry'])),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                            color: Colors.grey.shade400,
                            child: Container(
                              child: Center(child: Text('Validation States')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child: Center(
                              child: Text(list2[i]['Validation_States'])),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                if (list2[i]['Validation_States'] == "Expired") {
                  cPatent_ID = int.parse(list2[i]['Patent_ID']);
                  cExaminer_ID = int.parse(list2[i]['Patent_Examiner_ID']);
                  cApplication_Office_ID = 1;
                  cFees_Paid = "True";
                  cRenewal_Status = "False";
                  addDatatoPA();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => new AlertDialog(
                            title: new Text(
                              "Added",
                              style: TextStyle(color: Colors.black),
                            ),
                            elevation: 24,
                          ));
                } else {
                  print("Already Approved");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => new AlertDialog(
                            title: new Text(
                              "Already Approved",
                              style: TextStyle(color: Colors.black),
                            ),
                            elevation: 24,
                          ));
                }
              });
        });
  }

  void addDatatoPA() {
    var url =
        "https://patent101.000webhostapp.com/PatentOffice/addDatatoRA.php";
    http.post(url, body: {
      "Patent_ID": cPatent_ID.toString(),
      "Application_Office_ID": cApplication_Office_ID.toString(),
      "Examiner_ID": cExaminer_ID.toString(),
      "Fees_Paid": cFees_Paid.toString(),
      "Renewal_Status": cRenewal_Status
    });
  }
}
//INSERT into Renewal_Applications(Patent_ID,Application_Office_ID,Examiner_ID,Fees_Paid,Renewal_Status) values(173093,1,500057,'True','False')
