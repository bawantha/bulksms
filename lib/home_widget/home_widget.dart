/*
*  home_widget.dart
*  BULKSMS
*
*  Created by Bawantha.
*  Copyright © 2018 riorainnovations. All rights reserved.
    */

import 'dart:io';

import 'package:bulksms/values/values.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bulk Sms Sender"),
        centerTitle: true,
        backgroundColor: AppColors.secondaryText,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
//              provider.valuereSet();

              exit(0);
//              Navigator.pushNamed(context, '/settings');
              // do something
              //Navigator.of(context).pushNamedAndRemoveUntil(
              //  '/settings', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
//            Container(
//              margin: EdgeInsets.only(left: 133, top: 56, right: 136),
//              child: Text(
//                "Bulk SMS Sender",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                  color: AppColors.primaryText,
//                  fontFamily: "AppleGothic",
//                  fontWeight: FontWeight.w300,
//                  fontSize: 12,
//                ),
//              ),
//            ),
//            Container(
//              height: 1,
//              margin: EdgeInsets.only(top: 23),
//              decoration: BoxDecoration(
//                color: AppColors.primaryElement,
//              ),
//              child: Container(),
//            ),
            Container(
              height: 296,
              margin: EdgeInsets.only(top: 90),
              child: Image.asset(
                "assets/images/group-1.png",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 316,
                height: 26,
                margin: EdgeInsets.only(top: 56, right: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: Text(
                        "Start SMS Campaign Now , Press ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      width: 23,
                      height: 23,
                      child: Image.asset(
                        "assets/images/icon-ionic-ios-add-circle-outline.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/createsms'),
                child: Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.only(right: 28, bottom: 19),
                  child: Image.asset(
                    "assets/images/floating-button.png",
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Templates"),
      ),
      body: Column(
        children: <Widget>[Text("asda")],
      ),
    );
  }
}
