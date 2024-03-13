import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_new_app/model/detailsmodel.dart';

class DetailsViewModel {
  List<Details> details = [];

  //fetch the content from json
  Future<void> fetchData() async {
    final String response = await rootBundle.loadString('assets/details.json');

    final List<dynamic> data = await json.decode(response);

    details = data.map((json) => Details.fromJson(json)).toList();
  }
}























// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class DetailsViewModel {
//   dynamic details;

// //fetch the content from json Api

//   Future apiCall() async {
//     http.Response response;

//     response = await http.get(Uri.parse("https://pastebin.com/raw/uj6vtukE"));

//     if (response.statusCode == 200) {
//       debugPrint('status : Good!');

//       final apiResponse = json.decode(response.body);

//       details = apiResponse;

//       debugPrint(details);
//     } else {
//       throw Exception('Failed to load details');
//     }
//   }
// }
