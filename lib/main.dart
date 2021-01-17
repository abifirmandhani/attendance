import 'package:absensi/services/services.dart';
import 'package:absensi/shared/shareds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/jadwal_bloc.dart';
import 'bloc/user_bloc.dart';
import 'bloc/absen_bloc.dart';
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
          BlocProvider(create: (_) => JadwalBloc()),
          BlocProvider(create: (_) => AbsenBloc())
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
