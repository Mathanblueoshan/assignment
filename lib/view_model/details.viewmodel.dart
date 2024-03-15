import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DetailsViewModel {
  dynamic details;

//fetch the content from json Api

  Future apiCall() async {
    
    http.Response response;

    response = await http.get(Uri.parse("https://pastebin.com/raw/uj6vtukE"));

    if (response.statusCode == 200) {
     
      debugPrint('status : Good!');

      final apiResponse = json.decode(response.body);

      details = apiResponse;

      // debugPrint(details["image"]);
    }
  }
}
