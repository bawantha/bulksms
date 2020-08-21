/*
*  main.dart
*  BULKSMS
*
*  Created by Bawantha.
*  Copyright © 2018 riorainnovations. All rights reserved.
    */

import 'package:bulksms/create_sms_widget/create_sms_widget.dart';
import 'package:bulksms/home_running_widget/home_running_widget.dart';
import 'package:bulksms/home_widget/home_widget.dart';
import 'package:bulksms/providers/createSmsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_widget/home_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateSmsProvider>(
      create: (BuildContext context) => CreateSmsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
//          '/': (context) => HomeWidget(),
          // When navigating to the "/" route, build the FirstScreen widget.
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/createsms': (context) => CreateSMSWidget(),
          '/running': (context) => HomeRunnigWidget(),
          '/template': (context) => Template(),
        },
        home: HomeWidget(),
      ),
    );
  }
}





//class AutoCompleteTextField extends StatefulWidget {
//  @override
//  AutoCompleteTextFieldState createState() {
//    return new AutoCompleteTextFieldState();
//  }
//}
//
//class AutoCompleteTextFieldState extends State<AutoCompleteTextField> {
//  TextEditingController _textFieldController = TextEditingController();
//  List<String> _listOfStrings = [
//    "Inducesmile.com",
//    "Blue",
//    "Red",
//    "Cyan",
//    "Flutter",
//    "React",
//    "Node.js",
//    "Android",
//    "Kotlin"
//  ];
//
//  List<String> _suggestedString = [];
//
//  _onChanged(String value) {
//    setState(() {
//      _suggestedString = _listOfStrings
//          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
//          .toList();
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('AutoComplete Textfield Example'),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              //Add padding around textfield
//              padding: EdgeInsets.symmetric(horizontal: 25.0),
//              child: TextField(
//                controller: _textFieldController,
//                autocorrect: true,
//                decoration:
//                InputDecoration(hintText: "This textfield auto completes"),
//                onChanged: _onChanged,
//              ),
//            ),
//            _suggestedString.length != 0
//                ? Padding(
//              padding: EdgeInsets.symmetric(horizontal: 25.0),
//              child: Card(
//                child: ListView(
//                  children: _suggestedString.map((string) {
//                    return ListTile(
//                      title: Text(string),
//                    );
//                  }).toList(),
//                ),
//              ),
//            )
//                : SizedBox(),
//          ],
//        ),
//      ),
//    );
//  }
//}