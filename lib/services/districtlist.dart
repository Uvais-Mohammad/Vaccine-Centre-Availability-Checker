import 'dart:convert';

import 'package:vaccine_checker/services/networkhelper.dart';

const vacUrl = 'https://cdn-api.co-vin.in/api';

class District {
  Future<dynamic> getDistricts({String? stateId}) async {
    var url = Uri.parse('$vacUrl/v2/admin/location/districts/$stateId');
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();
    var finalData = jsonDecode(data);
    return finalData;
  }
}
