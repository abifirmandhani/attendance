import 'dart:async';

import 'package:absensi/shared/shareds.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: mainColor,
        accentColor: accentColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      onGenerateRoute: router.generateRoute,
      initialRoute: LoginRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamSubscription<Position> streamSubscription;

  _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location service disabled");
      return Future.error("Location service disabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      print("Denied permanent");
      return Future.error("Denied permanenet");
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        print("Permission Denied (value : $permission)");
      }
    }

    streamSubscription = Geolocator.getPositionStream(
            desiredAccuracy: LocationAccuracy.best, distanceFilter: 1)
        .listen((Position position) {
      Flushbar(
        duration: Duration(seconds: 4),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: Colors.blue,
        message: position == null
            ? "uknown"
            : position.latitude.toString() +
                ", " +
                position.longitude.toString(),
      )..show(context);
    });
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MaterialApp(
      title: "Demo maps",
      debugShowCheckedModeBanner: false,
      home: MapSample(),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class MapSample extends StatefulWidget {
  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  GoogleMapController mapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  var initHeight = 0.25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: GoogleMap(
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
                initialChildSize: initHeight,
                minChildSize: 0.12,
                maxChildSize: 0.8,
                builder: (BuildContext context, s){
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      ),
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10
                      )]
                    ),
                    child: ListView(
                      controller: s,
                      children: <Widget>[
                        Text("data"),
                        Text("data"),
                        Text("data"),
                        Text("data"),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
