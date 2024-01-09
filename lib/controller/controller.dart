import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task2/model/model.dart';


class homescreencontroller with ChangeNotifier {
  List<Fakeresponse>? fetcheditems;

  bool isProductloading = false;
  fetchdata() async{
    isProductloading=true;
    notifyListeners();
  

    final Url = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(Url);
    final List? responseData=jsonDecode(response.body);
    fetcheditems=responseData?.map((e) => Fakeresponse.fromJson(e)).toList();
    print(fetcheditems);
    isProductloading=false;
    notifyListeners() ;
    
  }
    List<Fakeresponse>cartitems=[];
}

