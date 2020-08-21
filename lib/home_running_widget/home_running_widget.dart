/*
*  home_runnig_widget.dart
*  BULKSMS
*
*  Created by Bawantha.
*  Copyright © 2018 riorainnovations. All rights reserved.
    */

import 'dart:io';

import 'package:bulksms/providers/createSmsProvider.dart';
import 'package:bulksms/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRunnigWidget extends StatelessWidget {
  void onIconFeatherPauseCPressed(BuildContext context) {}

  void onIconFeatherStopCiPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    CreateSmsProvider provider = Provider.of<CreateSmsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryText,

        title: provider.head == provider.numbers.length
            ? Text("Completed..")
            : Text("Running..."),
        actions: provider.head == provider.numbers.length
            ? <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // do something
                    provider.valuereSet();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // do somethin
                    provider.valuereSet();

                    exit(0);
                    //SystemNavigator.pop();
                  },
                )
              ]
            : <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, bottom: 20, right: 20),
                  child: SizedBox(
                      width: 20,
                      height: 10,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        backgroundColor: Colors.white,
                      )),
                )
              ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 56,
              right: -13,
              bottom: 64,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
//                  Align(
//                    alignment: Alignment.topLeft,
//                    child: Container(
//                      margin: EdgeInsets.only(left: 86),
//                      child: Text(
//                        "Bulk SMS Sender",
//                        textAlign: TextAlign.left,
//                        style: TextStyle(
//                          color: AppColors.primaryText,
//                          fontFamily: "AppleGothic",
//                          fontWeight: FontWeight.w300,
//                          fontSize: 24,
//                        ),
//                      ),
//                    ),
//                  ),
//                  Container(
//                    height: 1,
//                    margin: EdgeInsets.only(top: 9),
//                    decoration: BoxDecoration(
//                      color: AppColors.primaryElement,
//                    ),
//                    child: Container(),
//                  ),
                  Spacer(),
//                  Container(
//                    height: 71,
//                    margin: EdgeInsets.only(left: 59, right: 94),
//                    child: Row(
//                      crossAxisAlignment: CrossAxisAlignment.stretch,
//                      children: [
//                        Align(
//                          alignment: Alignment.bottomLeft,
//                          child: Container(
//                            width: 67,
//                            height: 67,
//                            child: FlatButton(
//                              onPressed: () => this.onIconFeatherStopCiPressed(context),
//                              color: Color.fromARGB(0, 0, 0, 0),
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.all(Radius.circular(0)),
//                              ),
//                              textColor: Color.fromARGB(255, 0, 0, 0),
//                              padding: EdgeInsets.all(0),
//                              child: Text(
//                                "stop",
//                                textAlign: TextAlign.left,
//                                style: TextStyle(
//                                  color: Color.fromARGB(255, 0, 0, 0),
//                                  fontWeight: FontWeight.w400,
//                                  fontSize: 12,
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                        Spacer(),
//                        Align(
//                          alignment: Alignment.bottomLeft,
//                          child: Container(
//                            width: 67,
//                            height: 67,
//                            margin: EdgeInsets.only(bottom: 4),
//                            child: FlatButton(
//                              onPressed: () => this.onIconFeatherPauseCPressed(context),
//                              color: Color.fromARGB(0, 0, 0, 0),
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.all(Radius.circular(0)),
//                              ),
//                              textColor: Color.fromARGB(255, 0, 0, 0),
//                              padding: EdgeInsets.all(0),
//                              child: Text(
//                                "pause",
//                                textAlign: TextAlign.left,
//                                style: TextStyle(
//                                  color: Color.fromARGB(255, 0, 0, 0),
//                                  fontWeight: FontWeight.w400,
//                                  fontSize: 12,
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
                ],
              ),
            ),
            Positioned(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Container(
                      width: 341,
                      height: 341,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                        border: Border.fromBorderSide(Borders.secondaryBorder),
                        borderRadius: BorderRadius.all(Radius.circular(170.5)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width * 0.36,
                    child: Column(
                      children: <Widget>[
                        Text(
                          provider.head.toString() +
                              "/" +
                              provider.numbers.length.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.w400,
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
//                  provider.head == provider.numbers.length
//                      ? Positioned(
//                          bottom: 50,
//                          right: MediaQuery.of(context).size.width * 0.4,
//                          child: FlatButton(
//                            shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(18.0),
//                                side: BorderSide(color: Colors.blue)),
//                            onPressed: () {
//
//                            },
//                            child: Text("Go to Home"),
//                          ),
//                        )
//                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
