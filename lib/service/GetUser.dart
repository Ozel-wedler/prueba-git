import 'dart:convert';

import 'package:cashflow/model/User.dart';
import 'package:dio/dio.dart';

class GetUser {
  final _url = "https://randomuser.me/api/?results=20";

  Future<List<User>> getUser() async {
    List<User> users = [];
    print("entro aqui");
    try {
      Response response = await Dio().get(_url);
      List<dynamic> s = response.data["results"];
      for (var item in s) {
        users.add(User(
            name: item["name"]["first"] + " " + item["name"]["last"],
            email: item["email"],
            picture: item["picture"]["large"],
            phone: item["phone"]));
      }
      return users;
    } catch (e) {
      return [];
    }
  }
}
