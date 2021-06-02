import 'dart:convert';

import 'package:vaccine_checker/services/networkhelper.dart';

const vacurl = 'https://cdn-api.co-vin.in/api';

class VaccineData {
  Future<dynamic> vacPin({String? pin, String? date}) async {
    dynamic url = Uri.parse(
        '$vacurl/v2/appointment/sessions/public/findByPin?pincode=$pin&date=$date');
    NetworkHelper networkHelper = NetworkHelper(url);
    var vaccineData = await networkHelper.getData();
    return vaccineData;
  }

  Future<dynamic> vacDistrict({String? districtId, String? date}) async {
    var url = Uri.parse(
        '$vacurl/v2/appointment/sessions/public/findByDistrict?district_id=$districtId&date=$date');
    print(url);
    NetworkHelper networkHelper = NetworkHelper(url);
    var vaccineData = await networkHelper.getData();
    var finalData = jsonDecode(vaccineData);
    return finalData;
  }
}
