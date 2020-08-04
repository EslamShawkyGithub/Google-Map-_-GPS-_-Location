import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_map_and_gps/gps_enable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GPSEnable _gpsEnable = GPSEnable();
  Completer<GoogleMapController> _completer;
  List<Marker> marker = [
    Marker(markerId: MarkerId('First Marker'),
      position: LatLng(30.882857, 30.637250),
    ),
    Marker(markerId: MarkerId('Second Marker'),
      position: LatLng(30.882845, 30.637240),
    ),
    Marker(markerId: MarkerId('Second Marker'),
      position: LatLng(30.882825, 30.637250),
    ),Marker(markerId: MarkerId('Second Marker'),
      position: LatLng(30.882815, 30.637230),
    ),Marker(markerId: MarkerId('Second Marker'),
      position: LatLng(30.882875, 30.637220),
    ),Marker(markerId: MarkerId('Second Marker'),
      position: LatLng(30.882810, 30.63725),
    ),
  ];

@override
  void initState() {
    super.initState();
    _gpsEnable.enabledGps().then((value) => (_){
      print('yes');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.call,color: Colors.white,), onPressed: (){})
        ],
      ),
      body: Center(
        child: GoogleMap(
          onMapCreated: (GoogleMapController controller){
            _completer.complete(controller);
          },
          initialCameraPosition: CameraPosition(target: LatLng(30.882857, 30.637250),
          zoom: 8,
        ),
          markers: Set.from(marker),
          mapType: MapType.normal,
        ),
      ),
    );
  }
}
