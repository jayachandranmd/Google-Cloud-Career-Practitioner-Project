import 'package:chargeio/screens/login.dart';
import 'package:chargeio/screens/splash_screen.dart';
import 'package:chargeio/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ChargeIO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: blue, fontFamily: "poppins"),
        home: !kIsWeb ? const SplashScreen() : const LoginPage());
  }
}
