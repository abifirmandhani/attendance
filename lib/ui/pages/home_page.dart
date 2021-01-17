part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
    context.read<JadwalBloc>().add(FetchJadwal());
  }

  Widget cek(var data) {
    print(data is UserLoaded ? data.guru.Alamat : "kosong");
    return Text("asd");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, userState) {
        return BlocBuilder<JadwalBloc, JadwalState>(
            builder: (BuildContext context, jadwalState) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "ePresensi",
                      style: blackFonts.copyWith(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: mainColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userState is UserLoaded
                                    ? userState.guru.Nama
                                    : ".....",
                                style: blackNumberFonts.copyWith(
                                    color: Colors.white),
                              ),
                              Text(
                                userState is UserLoaded
                                    ? userState.guru.Nip ?? "...."
                                    : ".....",
                                style: blackNumberFonts.copyWith(
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            child: ClipOval(
                              child: Image.asset("assets/base.png"),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: jadwalState is JadwalLoad
                              ? SpinKitFadingCircle(color: mainColor)
                              : jadwalState is JadwalEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        lottie.Lottie.asset("assets/empty.json",
                                            width: 100, height: 100),
                                        Text("Tidak ada jadwal", style: blackFonts.copyWith(fontSize: 16),)
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              jadwalState is JadwalLoaded
                                                  ? jadwalState
                                                      .listJadwal[0].NamaMapel
                                                  : "",
                                              style: blackFonts.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey
                                                        .withOpacity(0.3),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                jadwalState is JadwalLoaded
                                                    ? jadwalState
                                                        .listJadwal[0].NamaKelas
                                                    : "",
                                                style:
                                                    blackNumberFonts.copyWith(
                                                        color: accentColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.alarm),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              jadwalState is JadwalLoaded
                                                  ? jadwalState
                                                      .listJadwal[0].Jam
                                                  : "",
                                              style: blackNumberFonts.copyWith(
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.calendar_today),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              jadwalState is JadwalLoaded
                                                  ? jadwalState
                                                      .listJadwal[0].Hari
                                                  : "",
                                              style: blackNumberFonts.copyWith(
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.notes),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "3 Jam pelajaran",
                                              style: blackNumberFonts.copyWith(
                                                  fontSize: 16),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonWidget("Absensi", mainColor, () {
                      Navigator.pushNamed(context, MapRoute);
                    })
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
