import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeViewModel extends ChangeNotifier{
 

    init() {
   
  
   
     
   }

 List modelitems = [];

   //fetch the content from json
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/properties.json');
    debugPrint(response);
    final data = await json.decode(response);

    modelitems = data;
 
 debugPrint(data);

 setState(){

   modelitems = data["items"];
   
 }

 notifyListeners();
  }
}