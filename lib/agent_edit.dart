import 'package:flutter/material.dart';

class agent_edit extends StatelessWidget{
  final String agentName;

  agent_edit({ required this.agentName});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(agentName),
      ),
    body: Text('You are in agent configuration edit page'),
    );
  }


}