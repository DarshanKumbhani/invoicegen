import 'package:flutter/material.dart';
import 'package:inoicegernrator/Screen/homepage.dart';
import 'package:inoicegernrator/Screen/view.dart';
import 'Screen/edata.dart';
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(contex)=>home(),
        'edata':(contex)=>edata(),
        'pre':(contex)=>pre(),
      },
    ),
  );
}