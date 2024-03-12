import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/homemodel.dart';

class HomeViewModel {


 List<Items> modelitems = [];

   //fetch the content from json
  Future<void> readJson() async {
    
    final String response = await rootBundle.loadString('assets/properties.json');
   
    final List<dynamic> data = await json.decode(response);

    modelitems = data.map((json) => Items.fromJson(json)).toList();
 
  }
}