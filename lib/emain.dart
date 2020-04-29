import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'eDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// final _firestore = Firestore.instance;
// FirebaseUser loggedInUser;



class EMyApp extends StatefulWidget {
  const EMyApp({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _EMyAppState createState() => _EMyAppState();
}
class _EMyAppState extends State<EMyApp> {
  
  Future<List> getData() async {
    final response = await http.get(
        "https://patent101.000webhostapp.com/PatentOffice/getExaminer.php");
    return json.decode(response.body);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('Examiners')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(widget.user.uid);
        },
        child: Icon(Icons.add),
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
                if (ss.data[i]['UID'] ==
                    widget.user.uid) {
                  list3.add(ss.data[i]);
                }
              }
              if(widget.user.email=="admin@gmail.com"){
                  return Items(list: ss.data);
                }
              return Items(list: list3);
            }
             else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class Items extends StatelessWidget {
  List list;
  
  Items({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (ctx, i) {
          return ListTile(
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                      color: Colors.grey.shade400,
                      child: Container(
                        child: Center(
                          child: Text('Name'),
                        ),
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                      )),
                ),
                Expanded(
                  child: Card(
                      child: Container(
                    child: Center(
                      child: Text(list[i]['Name']),
                    ),
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  )),
                ),
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                      color: Colors.grey.shade400,
                      child: Container(
                        child: Center(
                          child: Text('Examiner ID'),
                        ),
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                      )),
                ),
                Expanded(
                  child: Card(
                      child: Container(
                    child: Center(
                      child: Text(list[i]['Patent_Examiner_ID']),
                    ),
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  )),
                ),
              ],
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    Details(list: list, index: i),
              ),
            ),
          );
        });
  }
}
