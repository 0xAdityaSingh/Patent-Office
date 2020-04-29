import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PForm extends StatefulWidget {
  // List list;
  String index;
  PForm({this.index});
  @override
  _PFormState createState() => _PFormState();
}

class _PFormState extends State<PForm> {
  TextEditingController  cTitle=new TextEditingController();
  TextEditingController  cSubject=new TextEditingController();
  TextEditingController  cOFS=new TextEditingController();
  TextEditingController  cInventor=new TextEditingController();
  TextEditingController  cExpense=new TextEditingController();
  TextEditingController  cAtt_ID=new TextEditingController();
  TextEditingController  cLang=new TextEditingController();
  // TextEditingController  cuid=new TextEditingController();

  
  // String cSubject;
  // int cExaminer_ID;
  // String cInventor;
  // int cExpense;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(backgroundColor: Colors.black,
        title: Center(child: Text('Application')),),
        body: Container(
          child:SingleChildScrollView(
                      child: Column(children: <Widget>[
              TextField(
                    controller: cTitle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    )),
                    TextField(
                    controller: cSubject,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Subject',
                    )),
                    TextField(
                    controller: cInventor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Inventor',
                    )),
                    TextField(
                    controller: cExpense,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expense in US',
                    )),
                    TextField(
                    controller: cAtt_ID,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Patent Attorney ID',
                    )),
                    TextField(
                    controller: cOFS,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Opposition Filled Status',
                    )),
                    TextField(
                    controller: cLang,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Filling Language',
                    )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RaisedButton(
                color: Colors.black,
                onPressed: (){

                  addDatatoPending();
                  
                                    },
                                    child: Text('Submit',style: TextStyle(color:Colors.white),),
                                  ),
                    ),
                              ],),
                            )
                          ),
                        
                      );
                    }
                  
                    void addDatatoPending() {
    var url =
        "https://patent101.000webhostapp.com/PatentOffice/addPending.php";
    http.post(url, body: {
      "Title":cTitle.text,
      "Subject":cSubject.text,
      "Patent_Examiner_ID":500001.toString(),
      "Inventor":cInventor.text,
      "Expense_in_US":cExpense.text,
      "Patent_Attorney_ID":cAtt_ID.text,
      "Opposition_Filled_Status":cOFS.text,
      "Filling_Language":cLang.text,
      "Patentee_ID":widget.index,
    });
    print(widget.index);
  }
}