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
                    "200 meter",
                    style: blackFonts.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: accentColor),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(Icons.add_a_photo_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Ambil Foto")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.6)),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
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
                          Icon(Icons.close)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonWidget("Absen", mainColor, (){
                    
                  })
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
