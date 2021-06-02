import 'package:http/http.dart' as http;

class NetworkHelper {
  final dynamic url;
  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.statusCode);
      var data = response.body;
      print(data);
      return data;
    } else {
      print("Some error has occurred");
      print(response.statusCode);
    }
  }
}
