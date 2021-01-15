part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        SizedBox.expand(
            child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller){
            mapController = controller;
          },
        )),
        SizedBox.expand(
          child: DraggableScrollableSheet(
            initialChildSize: 0.25,
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
            }
          )
        )
      ]),
    );
  }
}
