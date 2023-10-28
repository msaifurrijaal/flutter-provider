import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:latihan_get_list/models/user.dart';

class Repository {
  final _baseUrl = "https://reqres.in/api/users?page=2";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['data'];
        List<User> user = it.map((e) => User.fromJson(e)).toList();
        return user;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
