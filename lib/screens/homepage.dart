import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vaccine_checker/widgets/searchbutton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.darken),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Vaccine Centre Availability Checker"),
            actions: [
              IconButton(
                padding: EdgeInsets.only(right: 5),
                onPressed: () {
                  Navigator.pushNamed(context, '/info');
                },
                icon: Icon(Icons.info_outline),
                tooltip: 'Info',
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
              ),
              CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                radius: 75,
              ),
              Text(
                'VacApp',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 116,
              ),
              SearchButton(
                  context: context,
                  route: '/vac_pin',
                  label: 'Search by PIN Code'),
              SearchButton(
                  context: context,
                  route: '/vac_district',
                  label: '  Search by District  '),
            ],
            // ),
          ),
        ),
      ],
    );
  }
}
