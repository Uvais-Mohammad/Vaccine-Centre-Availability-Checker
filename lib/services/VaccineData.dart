import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vaccine_checker/services/networkhelper.dart';

const vacurl = 'https://cdn-api.co-vin.in/api';

class VaccineData {
  Future<dynamic> vacPin({String? pin, String? date}) async {
    dynamic url = Uri.parse(
        '$vacurl/v2/appointment/sessions/public/findByPin?pincode=$pin&date=$date');
    print(url);

    NetworkHelper networkHelper = NetworkHelper(url);
    var vaccineData = await networkHelper.getData();
    return vaccineData;
  }

  Future<dynamic> vacDistrict({String? districtId, String? date}) async {
    var url = Uri.parse(
        '$vacurl/v2/appointment/sessions/public/findByDistrict?district_id=$districtId&date=$date');
    NetworkHelper networkHelper = NetworkHelper(url);
    var vaccineData = await networkHelper.getData();
    var finalData = jsonDecode(vaccineData);
    return finalData;
  }

  void getSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
      content: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('🟩 : Available Slot'),
              SizedBox(
                height: 8,
              ),
              Text('🟥 : Non-Available Slot'),
            ],
          ),
        ],
      ),
      duration: Duration(seconds: 3),
    ));
  }

  void alertBox(
      {required BuildContext context,
      required String mainText,
      required String bodyText}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(mainText),
              content: Text(bodyText),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel')),
                TextButton(
                    onPressed: () => Navigator.pop(context), child: Text('OK'))
              ],
            ));
  }
}
