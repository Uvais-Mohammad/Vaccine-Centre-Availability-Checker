import 'package:flutter/material.dart';
import 'package:vaccine_checker/services/VaccineData.dart';
import 'package:vaccine_checker/services/districtlist.dart';
import 'package:vaccine_checker/services/statelist.dart';

class VaccineDistrict extends StatefulWidget {
  @override
  _VaccineDistrictState createState() => _VaccineDistrictState();
}

class _VaccineDistrictState extends State<VaccineDistrict> {
  String? stateValue;
  List? stateList;
  String? districtValue;
  List? districtList;

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

  void stateFunction() async {
    StateClass state = StateClass();
    var data = await state.getState();
    setState(() {
      stateList = data['states'];
    });
  }

  void districtFunction() async {
    District district = District();
    var data = await district.getDistricts(stateId: stateValue);
    setState(() {
      districtList = data['districts'];
    });
  }

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
    addNewData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stateFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vaccine Centre Availability Checker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
            child: Container(
              color: Colors.grey.shade300,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                      value: stateValue,
                      hint: Text('Select your State'),
                      onChanged: (value) {
                        setState(() {
                          stateValue = value;
                          districtFunction();
                        });
                      },
                      icon: (null),
                      iconSize: 30,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                      items: stateList?.map<DropdownMenuItem<String>>((item) {
                        return DropdownMenuItem<String>(
                          child: Text(item['state_name']),
                          value: item['state_id'].toString(),
                        );
                      }).toList()),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 10),
            child: Container(
              color: Colors.grey.shade300,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    value: districtValue,
                    icon: (null),
                    iconSize: 30,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    hint: Text('Select a district'),
                    onChanged: (value) {
                      setState(() {
                        districtValue = value;
                        print(districtValue);
                      });
                    },
                    items: districtList?.map<DropdownMenuItem<String>>((item) {
                      return DropdownMenuItem<String>(
                        child: Text(item['district_name']),
                        value: item['district_id'].toString(),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                dataCards = [];
                print("Pressed Submit");
                VaccineData vaccineData = VaccineData();
                var data = await vaccineData.vacDistrict(
                    districtId: districtValue, date: date);
                print(data['sessions'].length);
                for (int i = 0; i < data['sessions'].length; i++) {
                  print(i);
                  updateUI(data, i);
                }
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
