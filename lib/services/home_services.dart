import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/home_model.dart';

class HomeServices {

  var baseUrl = "https://api.spacexdata.com/v4/rockets";

  getRocketsList() async {
    try{
      var client = Dio();
      var ur = baseUrl;
      var response = await Dio().get(ur);
      if(response.statusCode == 200){
        var rd = response.data;
        return rd.map((e) => HomeModel.fromJSON(e)).toList();
      }
    }
    catch(error){
        throw Exception(error);
    }
  }

}