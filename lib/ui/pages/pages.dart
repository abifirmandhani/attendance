
import 'dart:async';
import 'dart:io';

import 'package:absensi/bloc/jadwal_bloc.dart';
import 'package:absensi/bloc/user_bloc.dart';
import 'package:absensi/bloc/absen_bloc.dart';
import 'package:absensi/models/models.dart';
import 'package:absensi/shared/shareds.dart';
import 'package:absensi/ui/widget/widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart' as lottie;

part 'login_page.dart';
part 'map_page.dart';
part 'unknown_page.dart';
part 'home_page.dart';