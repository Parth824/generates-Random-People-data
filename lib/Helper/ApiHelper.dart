import 'dart:convert';

import 'package:http/http.dart' as ht;
import 'package:sky3/model/rendeom.dart';

class helperapi {
  helperapi._();

  static final helperapi hlpa = helperapi._();

  Future<rendeom?> getfined() async {
    String api = "https://randomuser.me/api/";

    ht.Response response = await ht.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map co = json.decode(response.body);

      
      rendeom k = rendeom.fromjson(data: co);
      print(co);
      return k;
    }
  }
}
