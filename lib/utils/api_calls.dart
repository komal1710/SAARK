import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:saark/models/tank.dart';

Future<List<Tank>> updateTanks({required String username, required String password}) async {
  List<Tank> uniqueTanks = [];

  final response = await http.post(
    Uri.parse('http://139.59.9.2:8082/api/live/user'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
  if (response.statusCode == 200 && !response.body.contains('Invalid')) {
    Iterable resp = json.decode(response.body);
    List<Tank> tanks = List<Tank>.from(resp.map((tank) {
      if (tank != null) return Tank.fromJsonBasicJson(tank);
    }));

    // Remove tanks that are not the DMAC type.
    // Tank.volumePercent set to -1 in Tank.fromJsonBasicJson()
    tanks.removeWhere((element) => element.volumePercent == -1);

    //To remove duplicates with same tank name
    for (Tank tank in tanks) {
      uniqueTanks.removeWhere((element) => element.name == tank.name);
      uniqueTanks.add(tank);
    }

    // To sort the tanks by tank name
    uniqueTanks.sort(
      (a, b) => int.parse(
        a.name.replaceFirst('Tank ', ''),
      ).compareTo(
        int.parse(
          b.name.replaceFirst('Tank ', ''),
        ),
      ),
    );
  }
  return uniqueTanks;
}

Stream<List<Tank>> streamTanks({required String username, required String password, required Duration refreshTime}) async* {
  while (true) {
    await Future.delayed(refreshTime);
    yield await updateTanks(username: username, password: password);
  }
}
