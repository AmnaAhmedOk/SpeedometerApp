import 'dart:async';
import 'package:location/location.dart';
import 'package:speedometerflutterapp_amnaahmed/model/speed_model.dart';

class SpeedProvider {
  SpeedoMeterModel _currentLocation;
  int increaseSpeedTime = 0;
  int decreaseSpeedTime = 0;
  int currentSpeed = 0;
  bool isReachThirty = false;
  var location = Location();

  Future<SpeedoMeterModel> getSpeed() async {
    try {
      var locationData = await location.getLocation();
      _currentLocation = SpeedoMeterModel(
          increaseSpeedTime: increaseSpeedTime,
          decreaseSpeedTime: decreaseSpeedTime,
          speed: (locationData.speed*3.6).round());
    } on Exception catch (e) {
      print('Unable to get location: ${e.toString()}');
    }
    return _currentLocation;
  }

  StreamController<SpeedoMeterModel> _locationController =
      StreamController<SpeedoMeterModel>();

  Stream<SpeedoMeterModel> get locationStream => _locationController.stream;

  SpeedProvider() {
    location.requestPermission().then((granted) {
      if (granted != null) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            currentSpeed = (locationData.speed*3.6).round();
            if (currentSpeed >= 10 && currentSpeed <= 30 && !isReachThirty) {
              //Timer.periodic(Duration(seconds: 1), (Timer timer) => );
              Future.delayed(Duration(seconds: 1));
              increaseSpeedTime++;
            } else if (currentSpeed > 30) {
              isReachThirty = true;
            } else if (currentSpeed >= 10 &&
                currentSpeed <= 30 &&
                isReachThirty) {
              Future.delayed(Duration(seconds: 1));
              decreaseSpeedTime += 1;
            }

            _locationController.add(SpeedoMeterModel(
                increaseSpeedTime: increaseSpeedTime,
                decreaseSpeedTime: decreaseSpeedTime,
                speed: currentSpeed));
          }
        });
      }
    });
  }
}
