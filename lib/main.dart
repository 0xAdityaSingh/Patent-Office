import 'package:flutter/material.dart';

import 'sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:patent/pmain.dart';

// import 'emain.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
  
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);


//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) { 
//     return Scaffold(
// appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Center(child: Text("LOGIN")),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
          
//           MaterialButton(
//             color: Colors.black,
//               child: Text("Patentee",style: TextStyle(color:Colors.white ),),
//               onPressed: () {
                
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (BuildContext context) => PMyApp(),
//                 ));
//               }),
//           MaterialButton(
//             color: Colors.black,
//               child: Text("Examiner",style: TextStyle(color:Colors.white ),),
//               onPressed: () {
                
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (BuildContext context) => EMyApp(),
//                 ));
//               })
//         ]),
//       ),
//     );
//   }
// }
