part of 'pages.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MapWidget(),
      ),
    );
  }
}

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;
  StreamSubscription<Position> streamSubscription;
  Position currentPosition;

  Set<Marker> _markers = {};
  Set<Circle> _circles = {};

  File foto;
  int jarak;

  LatLng schoolLocation = LatLng(-1.2335883, 116.8966843);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-1.2335883, 116.8966843),
    zoom: 14.4746,
  );

  @override
  void initState() {
    _getLocation();
    _markers.add(
      Marker(
        markerId: MarkerId("3.595196, 98.672226"),
        position: LatLng(-1.2335883, 116.8966843),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    _circles.add(
      Circle(
        circleId: CircleId("1"),
        center: LatLng(-1.2335883, 116.8966843),
        radius: 50,
        fillColor: accentColor.withOpacity(0.3),
        strokeColor: accentColor.withOpacity(0.3),
        strokeWidth: 1
      )
    );
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  void _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location service disabled");
      return Future.error("Location service disabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      print("Permission denied forever");
      return Future.error("Permission denied forever");
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        print("Permission denied $permission");
        return Future.error("Permission denied $permission");
      }
    }

    streamSubscription = Geolocator.getPositionStream(
            desiredAccuracy: LocationAccuracy.best, distanceFilter: 1)
        .listen((Position position) {
          calculateDistance(position);
      CameraPosition newPos = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 19.151926040649414);
      mapController.animateCamera(CameraUpdate.newCameraPosition(newPos));
    });
  }


  void calculateDistance(Position position){
    double distance = Geolocator.distanceBetween(position.latitude, position.longitude, schoolLocation.latitude, schoolLocation.longitude);
    setState(() {
      jarak = distance.toInt();
    });
  }

  final picker = ImagePicker();
  Future getPhoto() async {
    try {
      final pickedFoto = await picker.getImage(source: ImageSource.camera);
      if (pickedFoto == null) {
        print("canceled by user");
      } else {
        setState(() {
          foto = File(pickedFoto.path);
        });
      }
    } catch (error) {
      print("Error : " + error.toString());
      Flushbar(
          message: "Error",
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.BOTTOM,
          backgroundColor: accentColor)
        ..show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        SizedBox.expand(
            child: GoogleMap(
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          markers: _markers,
          circles: _circles,
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    jarak == null ? "... Meter" : jarak.toString()+" Meter",
                    style: blackFonts.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: accentColor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  foto == null
                      ? InkWell(
                          onTap: () {
                            getPhoto();
                          },
                          child: Row(
                            children: [
                              Icon(Icons.add_a_photo_outlined,
                                  color: Colors.amber),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Ambil Foto",
                                  style: blackFonts.copyWith(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.6)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.image),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Foto kelas.jpg")
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      foto = null;
                                    });
                                  },
                                  child: Icon(Icons.close),
                                )
                              ],
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonWidget("Absen", mainColor, () {})
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
