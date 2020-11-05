import 'package:anjayclub/API/ApiRequest.dart';
import 'package:anjayclub/model/Drama.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewModel{
  static ListView listDrama(data){
    var tile ;
    return ListView.builder(
        itemCount: data.length,
        itemBuilder:(context,index){
      return tile(data[index].title,data[index].image);
    });
  }
}

