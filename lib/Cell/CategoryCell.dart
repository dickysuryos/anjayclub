import 'dart:ffi';

import 'package:anjayclub/model/Drama.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCell{
      static List<Widget> category(List<Drama> data){
        print("ini data ${data}");
        List<Widget> category = List<Widget>();
        category = [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 10,),
              Text(
                "FILM CATEGORY",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
              height: 50,
              child: new ListView.builder (
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (BuildContext context,int index) {
                    return new Card(
                      shadowColor: Colors.black12,
                      margin: EdgeInsets.only(left: 10),
                      borderOnForeground: true,
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 20,),
                          Icon(Icons.video_collection,color: Colors.red[100*index]),
                          SizedBox(width: 5,),
                          Text(
                            data[index].title,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(width: 20,),
                        ],
                      ),
                    );
                  }
              )
          )
        ];
        return category;
      }

}