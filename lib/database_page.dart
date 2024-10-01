import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class database_page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Databases',
            style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF19427D),
        ));
  }
}