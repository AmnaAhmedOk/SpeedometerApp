import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/speed_item.dart';
import '../model/speed_model.dart';

class SpeedHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<SpeedoMeterModel>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SpeedItem(
            itemName: 'Current Speed',
            value:  userLocation==null?'0':'${userLocation?.speed}',
            unit: 'Kmh',
            isCurrentSpeed: true,
          ),
          SpeedItem(
              itemName: 'From 10 to 30',
              value: userLocation==null?'0':'${userLocation?.increaseSpeedTime}',
              unit: 'Seconds'),
          SpeedItem(
              itemName: 'From 30 to 10',
              value:  userLocation==null?'0':'${userLocation?.decreaseSpeedTime}',
              unit: 'Seconds')
        ],
      ),
    );
  }
}
