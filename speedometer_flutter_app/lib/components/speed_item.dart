import 'package:flutter/material.dart';
import 'package:speedometerflutterapp_amnaahmed/utilities/constant.dart';
class SpeedItem extends StatelessWidget {

  final String itemName;
  final String  unit;
  final String value;
  final bool isCurrentSpeed;

  SpeedItem({@required this.itemName, @required this.value, @required this.unit,this.isCurrentSpeed=false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    mainAxisSize: MainAxisSize.max,

    children: <Widget>[
        Text(
          '$itemName',
          style: TextStyle(fontSize: (isCurrentSpeed)?42:24,
            fontWeight: FontWeight.w500
          ),
        ),
      SizedBox(
          height:(isCurrentSpeed)?24:8 ,
        ),

        Text(
          '$value',
          style: TextStyle(
              fontFamily: 'DigitalDisplayRegular',
              fontSize: (isCurrentSpeed)?72:36,
              color: Colors.green),
        ),

      SizedBox(
        height:8 ,
      ),
        Text('$unit',
            style:kUnitStyle,
        )
      ],
    );
  }

}
