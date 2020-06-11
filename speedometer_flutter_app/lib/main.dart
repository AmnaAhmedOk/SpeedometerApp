
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedometerflutterapp_amnaahmed/providers/speed_provider.dart';
import 'package:speedometerflutterapp_amnaahmed/screens/location_screen.dart';
import 'model/speed_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<SpeedoMeterModel>(
      create: (BuildContext context) => SpeedProvider().locationStream,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
          ),
          home: Scaffold(
            body: SpeedHomeScreen(),
          )),
    );
  }
}

