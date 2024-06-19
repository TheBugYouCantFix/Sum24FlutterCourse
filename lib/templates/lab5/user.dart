// TODO add dependencies
// TODO add user.g.dart as part
// TODO add user.freezed.dart as part
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  // TODO task 3 to make this class for url http://jsonplaceholder.typicode.com/users/
    factory User({
    required int id,
    required String name,
    required String username,
    required String email,
    required Map<String, dynamic> address,
    required String phone,
    required String website,
    required Map<String, dynamic> company,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

Future<List<User>> fetchUsers() async {
  // TODO task 3.2 to make this function for url http://jsonplaceholder.typicode.com/users/ 
  // Using fabric from class
  final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((userJson) => User.fromJson(userJson)).toList();
  } else {
    throw Exception();
  }
}
