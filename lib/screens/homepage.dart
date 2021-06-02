import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vaccine Centre Availability Checker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/vac_pin');
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Search by PIN Code",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/vac_district');
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Search by District",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
