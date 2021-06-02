import 'package:flutter/material.dart';
import 'package:vaccine_checker/screens/homepage.dart';
import 'package:vaccine_checker/screens/vac_district.dart';
import 'package:vaccine_checker/screens/vac_pin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.green,
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      routes: {
        '/': (context) => HomePage(),
        '/vac_pin': (context) => VaccinePIN(),
        '/vac_district': (context) => VaccineDistrict(),
      },
    );
  }
}
