import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class file_storage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('File Storage',
            style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF19427D),
        ));
  }
}