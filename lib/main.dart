import 'package:flutter/material.dart';
import 'package:vaccine_checker/screens/homepage.dart';
import 'package:vaccine_checker/screens/vac_district.dart';
import 'package:vaccine_checker/screens/vac_pin.dart';
import 'package:vaccine_checker/screens/info_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

//<a href='https://www.freepik.com/vectors/cartoon'>Cartoon vector created by pikisuperstar - www.freepik.com</a>
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      routes: {
        '/info': (context) => InfoPage(),
        '/vac_pin': (context) => VaccinePIN(),
        '/vac_district': (context) => VaccineDistrict(),
      },
    );
  }
}
