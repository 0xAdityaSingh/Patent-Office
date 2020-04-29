import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pDetails.dart';
import 'Application.dart';

String id;
class PMyApp extends StatefulWidget {
  const PMyApp({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _PMyAppState createState() => _PMyAppState();
}

class _PMyAppState extends State<PMyApp> {

  Future<List> getData() async {
    final response = await http.get(
        "https://patent101.000webhostapp.com/PatentOffice/getPatentees.php");
    return json.decode(response.body);
  }

  // const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('Patentees')),
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
                      id=ss.data[i]["Patentee_ID"];
                  list3.add(ss.data[i]);
                }
                if(widget.user.email=="admin@gmail.com"){
                  return Items(list: ss.data);
                }
              }
              return Items(list: list3);


              
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
           floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>PForm(index: id),));
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Items extends StatelessWidget {
  List list;
  // const Items({Key key}) : super(key: key);
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
                          child: Text('Patentee Name'),
                        ),
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                      )),
                ),
                Expanded(
                  child: Card(
                      child: Container(
                    child: Center(
                      child: Text(list[i]['Patentee_Name']),
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
                          child: Text('Patentee Category'),
                        ),
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                      )),
                ),
                Expanded(
                  child: Card(
                      child: Container(
                    child: Center(
                      child: Text(list[i]['Patentee_Category']),
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
