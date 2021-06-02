import 'dart:convert';

import 'package:vaccine_checker/services/networkhelper.dart';

const vacUrl = 'https://cdn-api.co-vin.in/api/v2/admin/location/states';

class StateClass {
  Future<dynamic> getState() async {
    var url = Uri.parse(vacUrl);
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();
    var finalData = jsonDecode(data);
    return finalData;
  }
}
