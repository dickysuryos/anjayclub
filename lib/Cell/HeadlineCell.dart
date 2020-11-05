import 'dart:ffi';

import 'package:anjayclub/model/Drama.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadlineCell {
  BuildContext context;


  static List headline(BuildContext context,List<Drama> data) {
    List<Widget> headline = List<Widget>();
    headline = [
      Text(
        "NEWEST",
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          height: 2,
        ),
        textAlign: TextAlign.left,
      ),
      SizedBox(
        height: 10,
      ),
      ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(children: [
            Image.network(
              data[0].image,
              height: 230,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
          ])),
      SizedBox(height: 7),
      Text(
        "Start-Up",
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
      SizedBox(height: 7),
      Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 20,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 20,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 20,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text("5.0"),
          SizedBox(
            width: 2,
          ),
          Text("(200 Reviews)")
        ],
      )
    ];
    return headline;
  }
}
