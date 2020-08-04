import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class PermissionLocation{

  Location location = Location();
  PermissionStatus _permissionGranted;
  LocationData _locationData ;


  Future<void> getPermission() async{

    _permissionGranted = await location.hasPermission();

    if(_permissionGranted==PermissionStatus.granted){
      print('permission allowed before');
//
//      _locationData = await location.getLocation();
//      print('Latitude: '+_locationData.latitude.toString()+'  and  '+'Longitude: '+_locationData.longitude.toString());
       location.onLocationChanged.listen((event) {
         event.time.toString();
        print('Latitude: '+ event.latitude.toString()+'  and  '+'Longitude: '+ event.longitude.toString());
      });
    }
    else {

      _permissionGranted = await location.requestPermission();
      if(_permissionGranted==PermissionStatus.granted){
        print('permission allowed');

      }
      else {
        SystemNavigator.pop();
      }

    }

  }

}