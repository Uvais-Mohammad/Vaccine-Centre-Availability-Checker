import 'package:flutter/material.dart';
import 'package:vaccine_checker/services/VaccineData.dart';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';

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

  Color? boxColor;

  void addNewData(Color? color) {
    dataCards.add(
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: color,
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

  void updateUI(dynamic data, int i) {
    setState(() {
      vaccine = data['sessions'][i]['vaccine'];
      centreId = data['sessions'][i]['center_id'].toString();
      name = data['sessions'][i]['name'];
      address = data['sessions'][i]['address'];
      nDate = data['sessions'][i]['date'];
      fee = data['sessions'][i]['fee'];
      minAge = data['sessions'][i]['min_age_limit'].toString();
      dose1 = data['sessions'][i]['available_capacity_dose1'].toString();
      dose2 = data['sessions'][i]['available_capacity_dose2'].toString();
    });
    if (dose1 != '0' || dose2 != '0') {
      boxColor = Colors.green;
    } else {
      boxColor = Colors.red;
    }
    addNewData(boxColor);
  }

  void checkConnection(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
          label: '',
          onPressed: () {},
        ),
        content: Text('No Internet Connection'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    checkConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vaccine Centre Availability Checker"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.darken),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                maxLength: 6,
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
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    dataCards = [];
                  });
                  VaccineData vaccineData = VaccineData();
                  var data = await vaccineData.vacPin(pin: pinCode, date: date);
                  if (jsonDecode(data)["sessions"].isEmpty) {
                    vaccineData.alertBox(
                        context: context,
                        mainText: 'Error',
                        bodyText:
                            'Data for this PIN code is not available currently');
                  } else if (data == 400) {
                    vaccineData.alertBox(
                        context: context,
                        mainText: 'Invalid PIN',
                        bodyText: 'Please enter a valid PIN code');
                  } else {
                    vaccineData.getSnackBar(context);
                    var finalData = jsonDecode(data);
                    for (int i = 0; i < finalData['sessions'].length; i++) {
                      updateUI(finalData, i);
                    }
                  }
                },
                child: Text(
                  "Submit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
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
      ),
    );
  }
}
