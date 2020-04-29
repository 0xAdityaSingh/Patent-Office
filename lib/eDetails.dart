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
        title: Center(child: Text("${widget.list[widget.index]['Name']}")),
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
                if (int.parse(ss.data[i]['Examiner_ID']) ==
                    int.parse(
                        widget.list[widget.index]['Patent_Examiner_ID'])) {
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
        .get("https://patent101.000webhostapp.com/PatentOffice/getRA.php");
    
    return json.decode(response.body);
  }
}

class Items extends StatelessWidget {
  List list2;
  int cRenewal_Application_ID;
  String cRenewal_Status;
  String cRenewal_Status2;
    int cPatent_ID;
  Items({this.list2});
  void editData() async {
    
    String url =
        "https://patent101.000webhostapp.com/PatentOffice/editPatents.php";
    
        var res = await http.post(Uri.encodeFull(url), headers: {
          "Accept": "application/json"
        }, body: {
          'Validation_States': cRenewal_Status,
      'Patent_ID': cPatent_ID.toString(),
    });
    var respBody = json.decode(res.body);
    print(respBody);
  }
  void editData2() async {
    String url =
        "https://patent101.000webhostapp.com/PatentOffice/editRA.php";
    
        var res = await http.post(Uri.encodeFull(url), headers: {
          "Accept": "application/json"
        }, body: {
          'Renewal_Status': cRenewal_Status2,
      'Renewal_Application_ID': cRenewal_Application_ID.toString(),
    });
    var respBody = json.decode(res.body);
    print(respBody);
  }
    void delData() async {
    String url =
        "https://patent101.000webhostapp.com/PatentOffice/delApp.php";
    
        var res = await http.post(Uri.encodeFull(url), headers: {
          "Accept": "application/json"
        }, body: {
      'Renewal_Application_ID': cRenewal_Application_ID.toString(),
    });
  }
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
                              child: Center(child: Text('Patent ID')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child: Center(child: Text(list2[i]['Patent_ID'])),
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
                              child:
                                  Center(child: Text('Application Office ID')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child: Center(
                              child: Text(list2[i]['Application_Office_ID'])),
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
                              child: Center(child: Text('Examiner ID')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child: Center(child: Text(list2[i]['Examiner_ID'])),
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
                              child: Center(child: Text('Fees Paid')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child: Center(child: Text(list2[i]['Fees_Paid'])),
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
                              child: Center(child: Text('Renewal Status')),
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                            )),
                      ),
                      Expanded(
                        child: Card(
                            child: Container(
                          child:
                              Center(child: Text(list2[i]['Renewal_Status'])),
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: MaterialButton(
                          color: Colors.black,
                          child: Text("DELETE",style:TextStyle(color:Colors.white ),),
                          onPressed: (){
                            cRenewal_Application_ID=int.parse( list2[i]['Renewal_Application_ID']);
                            print(cRenewal_Application_ID);
                            delData();     

                          })
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => new AlertDialog(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              IconButton(icon: Icon(Icons.sentiment_satisfied,color: Colors.green,size: 35,), onPressed:(){
                                cPatent_ID=int.parse( list2[i]['Patent_ID']);
                                cRenewal_Status="Approved";
                                cRenewal_Application_ID=int.parse( list2[i]['Renewal_Application_ID']);
                                cRenewal_Status2="True";
                                editData();
                                editData2();
                              }),
                              new Container(
                                width: 30.0,
                                        ),
                              IconButton(icon: Icon(Icons.sentiment_dissatisfied,color: Colors.red,size: 35,), onPressed: (){
                                cPatent_ID=int.parse( list2[i]['Patent_ID']);
                                cRenewal_Status="Expired";
                                cRenewal_Application_ID=int.parse( list2[i]['Renewal_Application_ID']);
                                cRenewal_Status2="False";
                                editData();
                                editData2();
                              })
                            ],),
                            elevation: 24,
                          ));
              });
        });
  }
}
