import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_showcase/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:patent/emain.dart';

import 'pmain.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: Text("Login",style: TextStyle(color:Colors.white),)),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Provide an email';
                }
              },
              decoration: InputDecoration(
                labelText: 'Email'
              ),
              onSaved: (input) => _email = input,
            ),
            TextFormField(
              validator: (input) {
                if(input.length < 6){
                  return 'Longer password please';
                }
              },
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              onSaved: (input) => _password = input,
              obscureText: true,
            ),
            RaisedButton(
              color: Colors.black,
              onPressed: psignIn,
              child: Text('Sign in Patentee',style: TextStyle(color:Colors.white),),
            ),
            RaisedButton(
              color: Colors.black,
              onPressed: esignIn,
              child: Text('Sign in Examiner',style: TextStyle(color:Colors.white),),
            ),
          ],
        )
      ),
    );
  }

  void psignIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        
        // FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
    
        Navigator.push(context, MaterialPageRoute(builder: (context) => PMyApp(user: user)));
      }catch(e){
        print(e.message);
      }
    }
  }
  void esignIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
        Navigator.push(context, MaterialPageRoute(builder: (context) => EMyApp(user: user)));
      }catch(e){
        print(e.message);
      }
    }
  }
}