import 'dart:async';

import 'package:absensi/services/services.dart';
import 'package:absensi/shared/shareds.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'bloc/jadwal_bloc.dart';
import 'bloc/user_bloc.dart';
import 'router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreference().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => JadwalBloc())
        ],
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: mainColor,
            accentColor: accentColor,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.generateRoute,
          initialRoute: LoginRoute,
        ));
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
    return Scaffold(body: Container()
        // s trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
