import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Tani_Yuk/firebase_options.dart';
import 'package:Tani_Yuk/screens/logins.dart';
import 'package:Tani_Yuk/screens/signup.dart';
import 'package:Tani_Yuk/screens/splash_screen.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyUniqueApp());
}

class MyUniqueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Penjualan Produk Pertanian',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFFD700, <int, Color>{
          50: Color(0xFFFFF4B2),
          100: Color(0xFFFFED8C),
          200: Color(0xFFFFE660),
          300: Color(0xFFFFDF34),
          400: Color(0xFFFFD909),
          500: Color(0xFFFFD700),
          600: Color(0xFFFFD300),
          700: Color(0xFFFFCF00),
          800: Color(0xFFFFCA00),
          900: Color(0xFFFFC200),
        }),
      ),
      home: LoginScreen(),
    );
  }
}
