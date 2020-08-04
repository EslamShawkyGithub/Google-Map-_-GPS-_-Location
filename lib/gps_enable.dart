import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_map_and_gps/permission_location.dart';
import 'package:location/location.dart';

class GPSEnable {

  bool _serviceEnabled;
  Location location = Location();
  PermissionLocation _permissionLocation = PermissionLocation();

  Future<void> enabledGps()async{
    _serviceEnabled = await location.serviceEnabled();
    if(_serviceEnabled){
      print('GPS enabled before ');
     await _permissionLocation.getPermission();
    }
    else {
      _serviceEnabled = await location.requestService();
      if(_serviceEnabled){
     await _permissionLocation.getPermission();
      }
      else {
        SystemNavigator.pop();
      }
    }

  }

}