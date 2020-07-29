import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    print('RESPONSE BODY FROM NETWORKING.DART');
    print(response.body);

    if (response.statusCode == 200) {
      String data = response.body;
//      var decodedData = jsonDecode(data);
//      return decodedData;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
