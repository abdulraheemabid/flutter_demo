import 'package:demo/screens/alerts.dart';
import 'package:demo/screens/contact.dart';
import 'package:demo/screens/forms.dart';
import 'package:demo/screens/layouts.dart';
import 'package:demo/screens/steppers.dart';
import 'package:demo/screens/tabs.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff673ab7),
        accentColor: Color(0xffffd740),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xff673ab7),
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: TextTheme(
          bodyText2: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 11,
              ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Color(0xff673ab7),
          unselectedLabelColor: Colors.black54,
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xffffd740), width: 3),
            ),
            color: Color(0xffffd740).withOpacity(0.2),
          ),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: Color(0xff673ab7),
          inactiveTickMarkColor: Color(0xff673ab7),
          inactiveTrackColor: Color(0xff673ab7).withOpacity(0.2),
          thumbColor: Color(0xff673ab7),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xff673ab7),
        ),
        dataTableTheme: DataTableThemeData(
          headingRowColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return Color(0xff673ab7);
          }),
        ),
        iconTheme: IconThemeData(
          color: Color(0xff673ab7),
        ),
      ),
      home: MyHomePage(),
      routes: {
        "forms": (ctx) {
          return Forms();
        },
        "contact": (ctx) {
          return Contact();
        },
        "cards": (ctx) {
          return Layouts();
        },
        "alerts": (ctx) {
          return Alerts();
        },
        "tabs": (ctx) {
          return Tabs();
        },
        "steppers": (ctx) {
          return Steppers();
        },
      },
    );
  }
}
