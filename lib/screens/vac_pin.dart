import 'package:flutter/material.dart';
import 'package:vaccine_checker/services/VaccineData.dart';
import 'dart:convert';

class VaccinePIN extends StatefulWidget {
  @override
  _VaccinePINState createState() => _VaccinePINState();
}

class _VaccinePINState extends State<VaccinePIN> {
  List<Widget> dataCards = [];

  String? pinCode;
  String? date =
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  String vaccine = '';
  String centreId = '';
  String name = '';
  String address = '';
  String nDate = '';
  String fee = '';
  String minAge = '';
  String dose1 = '';
  String dose2 = '';

  void addNewData() {
    dataCards.add(
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Vaccine: "),
                  Text(vaccine),
                ],
              ),
              Row(
                children: [
                  Text("Centre ID: "),
                  Text('$centreId'),
                ],
              ),
              Row(
                children: [
                  Text("Name: "),
                  Text(name),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text("Address: "),
                    Text(address),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("Date: "),
                  Text(nDate),
                ],
              ),
              Row(
                children: [
                  Text("Fee Type: "),
                  Text(fee),
                ],
              ),
              Row(
                children: [
                  Text("Minimum Age Limit: "),
                  Text(minAge),
                ],
              ),
              Row(
                children: [
                  Text("Available Capacity for Dose 1: "),
                  Text(dose1),
                ],
              ),
              Row(
                children: [
                  Text("Available Capacity for Dose 2: "),
                  Text(dose2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateUI(dynamic data) {
    setState(() {
      dataCards = [];
      vaccine = data['sessions'][0]['vaccine'];
      centreId = data['sessions'][0]['center_id'].toString();
      name = data['sessions'][0]['name'];
      address = data['sessions'][0]['address'];
      nDate = data['sessions'][0]['date'];
      fee = data['sessions'][0]['fee'];
      minAge = data['sessions'][0]['min_age_limit'].toString();
      dose1 = data['sessions'][0]['available_capacity_dose1'].toString();
      dose2 = data['sessions'][0]['available_capacity_dose2'].toString();
    });
    addNewData();
  }

  @override
  Widget build(BuildContext context) {
    print(date);
    return Scaffold(
      appBar: AppBar(
        title: Text("Vaccine Centre Availability Checker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              onChanged: (value) {
                pinCode = value;
                print(pinCode);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  hintText: 'Enter the PIN code',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                print("Pressed Submit");
                VaccineData vaccineData = VaccineData();
                var data = await vaccineData.vacPin(pin: pinCode, date: date);
                var finalData = jsonDecode(data);
                print(finalData);
                print(finalData['sessions'][0]['vaccine']);
                print(finalData['sessions'][0]['center_id']);
                updateUI(finalData);
              },
              child: Text(
                "Submit",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: dataCards,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
