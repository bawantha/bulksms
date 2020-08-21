/*
*  create_smswidget.dart
*  BULKSMS
*
*  Created by Bawantha.
*  Copyright © 2018 riorainnovations. All rights reserved.
    */

import 'package:bulksms/providers/createSmsProvider.dart';
import 'package:bulksms/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:provider/provider.dart';

class CreateSMSWidget extends StatelessWidget {
  void onViewPressed(BuildContext context, CreateSmsProvider provider) {
    provider.loadFile();
  }

  void onSliderValueChanged(BuildContext context) {}

  void onViewTwoPressed(BuildContext context, CreateSmsProvider provider) {
    provider.processSms();
    // Navigator.popAndPushNamed(context, '/running');
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/running', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    CreateSmsProvider provider = Provider.of<CreateSmsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryText,

        title: Text('create campaign'),
      ),
      resizeToAvoidBottomPadding: true,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 251, 251, 251),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 21, right: 17, bottom: 28),
                child: Text(
                  "Upload Number List as .CSV",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "AppleGothic",
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                height: 131,
                margin: EdgeInsets.only(left: 20, right: 22, bottom: 27),
                child: FlatButton(
                  onPressed: () => this.onViewPressed(context, provider),
                  color: AppColors.primaryBackground,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromARGB(255, 145, 137, 255),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: Radii.k16pxRadius,
                  ),
                  textColor: Color.fromARGB(255, 112, 112, 112),
                  padding: EdgeInsets.all(0),
                  child: provider.csvState == CSVState.INIT
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/icon-awesome-file-upload.png",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "upload .csv",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "AppleGothic",
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                      : provider.csvState == CSVState.LOADING
                      ? CircularProgressIndicator()
                      : provider.csvState == CSVState.DONE
                      ? Text(provider.numbers.length.toString() +
                      " Contacts added..")
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/icon-awesome-file-upload.png",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "try again",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: "AppleGothic",
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 21, bottom: 23),
                child: Text(
                  " Random Time Delay",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "AppleGothic",
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                height: 32,
                margin: EdgeInsets.only(left: 30, right: 26, bottom: 37),
                child: FlutterSlider(
                  disabled: provider.csvState == CSVState.DONE ? false : true,
                  onDragCompleted: (handleIndex, lowerValue, upperValue) {
                    provider.setTimeDelayLimits(lowerValue, upperValue);
                  },
                  tooltip: FlutterSliderTooltip(
                    leftSuffix: Text("min."),
                    rightSuffix: Text("min"),
                  ),
                  values: provider.sliderState == SliderState.INIT
                      ? [1, 4]
                      : [
                    provider.lowerTimeDelayLimit,
                    provider.upperTimeDelayLimit
                  ],
                  rangeSlider: true,
                  max: 10,
                  min: 0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 26, bottom: 22),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Message",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontFamily: "AppleGothic",
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
//                    IconButton(
//                        icon: Icon(Icons.settings),
//                        onPressed: () {
//                          showDialog(
//                              context: context,
//                              barrierDismissible: true,
//                              builder: (BuildContext context) {
//                                TextEditingController _controller =
//                                    TextEditingController();
//                                return AlertDialog(
//                                  content: Stack(
//                                    overflow: Overflow.visible,
//                                    children: <Widget>[
////                                      Positioned(
////                                        right: -40.0,
////                                        top: -40.0,
////                                        child: GestureDetector(
////                                          onTap: () {
////                                            print("ta[[ed");
////                                            Navigator.of(context).pop();
////                                          },
////                                          child: CircleAvatar(
////                                            child: Icon(Icons.close),
////                                            backgroundColor: Colors.red,
////                                          ),
////                                        ),
////                                      ),
//                                      Form(
//                                        child: Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: <Widget>[
//                                            Text("Template"),
//                                            Padding(
//                                              padding: EdgeInsets.all(8.0),
//                                              child: TextFormField(
//                                                controller: _controller,
//                                                onChanged: (value) {
//                                                  provider
//                                                      .updateTemplate(value);
//                                                },
//                                                maxLines: 1,
//                                              ),
//                                            ),
//                                            Padding(
//                                              padding:
//                                                  const EdgeInsets.all(8.0),
//                                              child: RaisedButton(
//                                                shape: RoundedRectangleBorder(
//                                                  borderRadius:
//                                                      BorderRadius.all(
//                                                          Radius.circular(12)),
//                                                ),
//                                                child: Text("Save"),
//                                                onPressed: () {
//                                                  provider.commitTemplate();
//                                                  Navigator.pop(context);
//                                                },
//                                              ),
//                                            )
//                                          ],
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                );
//                              });
//                        })
                  ],
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(left: 21, right: 21, bottom: 25),
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  border: Border.fromBorderSide(Borders.primaryBorder),
                  borderRadius: Radii.k16pxRadius,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),

//                  child: TypeAheadFormField(
//                    textFieldConfiguration: TextFieldConfiguration(
////                          controller: this._typeAheadController,
//                    ),
//                    suggestionsCallback: (pattern) {
////                          return CitiesService.getSuggestions(pattern);
//                    },
//                    itemBuilder: (context, suggestion) {
//                      return ListTile(
//                        title: Text(suggestion),
//                      );
//                    },
//                    transitionBuilder: (context, suggestionsBox, controller) {
//                      return suggestionsBox;
//                    },
//                    onSuggestionSelected: (suggestion) {
////                          this._typeAheadController.text = suggestion;
//                    },
//                    validator: (value) =>
//                        value.isEmpty ? 'Please select a city' : null,
////                    onSaved: (value) => this._selectedCity = value,
//                  ),
                  child: TextFormField(
                    onChanged: (v) {
                      provider.updateMessage(v);
                    },
                    enabled:
                    provider.sliderState == SliderState.SET ? true : false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
//                    autocorrect: false,
                  ),
                ),
              ),
              provider.messageBoxState == MessageBoxState.SET ? Container(
                height: 50,
                margin: EdgeInsets.only(left: 48, right: 48, bottom: 20),
                child: RaisedButton(

                  onPressed: () => this.onViewTwoPressed(context, provider),
                  color: AppColors.secondaryElement,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromARGB(255, 108, 99, 255),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  textColor: Color.fromARGB(255, 112, 112, 112),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "Send Messages ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ):Container()
            ],
          ),
        ),
      ),
    );
  }
}
