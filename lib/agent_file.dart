import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'agent_edit.dart';
import 'database_page.dart';
import 'file_storage.dart';

class agent_page extends StatefulWidget {
  @override
  _AgentState createState() => _AgentState();
}

class _AgentState extends State<agent_page> {
  final TextEditingController _agentName = TextEditingController();
  final TextEditingController _displayName = TextEditingController();
  List<dynamic> agents = [];

  void fetchAgents() async {
    final wsId = 'ws-lzqngybb-29q1f2m2';
    print('Fetching agents...');
    final url = Uri.parse(
        'https://app-haiva.gateway.apiplatform.io/v1/getAllHaivaAgentsByWs?workspace-id=$wsId');
    final header = {
      'Authorization':
          'Bearer eyJraWQiOiIxIiwidHlwIjoiYXQrand0IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJhQzExY3kwNGJ6Sm1kUzFzZW5GdVozbGlPQzFzYVRWNWRnPT0iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiY3R4IjoicGVyc29uYWwiLCJpc3MiOiJodHRwczpcL1wvaGFpdmEuYXV0aGVudC53b3Jrc1wvYXV0aCIsImxvY2FsZSI6ImRlIiwibm9uY2UiOiJTR1ZJTlVwMWFuNU9NMmhFVG05VVNWOWpTRUprUlZWV1F6RkZVMUJaYXpaR1pFbDZTbXhHUXpsWFoyRXciLCJjbGllbnRfaWQiOiIzaDNkaGpnaHNpdnkzeDNoZWdqdTNnaWpjajNvY3I3ODRncmNIc3pQNEt0eUdublpkQVJCWHMiLCJhdWQiOiIzaDNkaGpnaHNpdnkzeDNoZWdqdTNnaWpjajNvY3I3ODRncmNIc3pQNEt0eUdublpkQVJCWHMiLCJuYmYiOjE3MjM1MjI2NDgsIm9yZ19pZCI6Im9yZy1senFuZ3liYi12Nnd4NCIsInNjb3BlIjoib3BlbmlkIGVtYWlsIiwibmFtZSI6ImxhdmFueWFAYXBpcGxhdGZvcm0uaW8iLCJleHAiOjE3MjM1NTE0NDgsImlhdCI6MTcyMzUyMjY0OCwianRpIjoiMzA0YzdjY2MtNGVlNy00ZTZiLTg2ZjgtMzQyMmI0NzY0YTliIiwiZW1haWwiOiJsYXZhbnlhQGFwaXBsYXRmb3JtLmlvIn0.L7UKvbkjZkNqNrzPppovN1hG8Hrf4pvFZ6F-fQRS2fIQe-ErlKW45HwIRD4C5q_sJgvsamzTc8g-T--bBOKQGGDIE7iAPyrHtPeQEylHT6gHyyLxEYrf5VLzfEy_5lHKMn-SnSbiqBvZxVsa_8pfE97dxHob0fHewXctXjrlIRpIeNH4weHl0815OafzyBtqNO27bOO3KBUga0NWvZnp_HRzYjQpdRUMOrd-pJ11Y0bGp8zbEAyFKv3j7Kd-p3Sx015-JzT0aouMyAcxxJwBrPXI0TIEQApqS76gvB5WfyAutLA7sAyKYZX8sRSS9jaGuoTPV8FAvwGF2mbvK945Cw'
    };

    try {
      final response = await http.get(url, headers: header);
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final agentsList = jsonDecode(response.body);

        setState(() {
          agents =
              agentsList['agent']; // Ensure this key exists in your response
          print(agents);
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to fetch agent data: $e');
    }
  }

  Future<String> deleteAgents(String agentId) async {
    print(agentId);
    final url1 = Uri.parse(
        'https://app-haiva.gateway.apiplatform.io/v1/deleteHaivaAgent?agentId=$agentId');
    final header = {
      'Authorization':
          'Bearer eyJraWQiOiIxIiwidHlwIjoiYXQrand0IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJhQzExY3kwNGJ6Sm1kUzFzZW5GdVozbGlPQzFzYVRWNWRnPT0iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiY3R4IjoicGVyc29uYWwiLCJpc3MiOiJodHRwczpcL1wvaGFpdmEuYXV0aGVudC53b3Jrc1wvYXV0aCIsImxvY2FsZSI6ImRlIiwibm9uY2UiOiJTR1ZJTlVwMWFuNU9NMmhFVG05VVNWOWpTRUprUlZWV1F6RkZVMUJaYXpaR1pFbDZTbXhHUXpsWFoyRXciLCJjbGllbnRfaWQiOiIzaDNkaGpnaHNpdnkzeDNoZWdqdTNnaWpjajNvY3I3ODRncmNIc3pQNEt0eUdublpkQVJCWHMiLCJhdWQiOiIzaDNkaGpnaHNpdnkzeDNoZWdqdTNnaWpjajNvY3I3ODRncmNIc3pQNEt0eUdublpkQVJCWHMiLCJuYmYiOjE3MjM1MjI2NDgsIm9yZ19pZCI6Im9yZy1senFuZ3liYi12Nnd4NCIsInNjb3BlIjoib3BlbmlkIGVtYWlsIiwibmFtZSI6ImxhdmFueWFAYXBpcGxhdGZvcm0uaW8iLCJleHAiOjE3MjM1NTE0NDgsImlhdCI6MTcyMzUyMjY0OCwianRpIjoiMzA0YzdjY2MtNGVlNy00ZTZiLTg2ZjgtMzQyMmI0NzY0YTliIiwiZW1haWwiOiJsYXZhbnlhQGFwaXBsYXRmb3JtLmlvIn0.L7UKvbkjZkNqNrzPppovN1hG8Hrf4pvFZ6F-fQRS2fIQe-ErlKW45HwIRD4C5q_sJgvsamzTc8g-T--bBOKQGGDIE7iAPyrHtPeQEylHT6gHyyLxEYrf5VLzfEy_5lHKMn-SnSbiqBvZxVsa_8pfE97dxHob0fHewXctXjrlIRpIeNH4weHl0815OafzyBtqNO27bOO3KBUga0NWvZnp_HRzYjQpdRUMOrd-pJ11Y0bGp8zbEAyFKv3j7Kd-p3Sx015-JzT0aouMyAcxxJwBrPXI0TIEQApqS76gvB5WfyAutLA7sAyKYZX8sRSS9jaGuoTPV8FAvwGF2mbvK945Cw'
    };
    try {
      final delresponse = await http.delete(url1, headers: header);
      if (delresponse.statusCode == 204) {
        return delresponse.body;
      } else {
        return 'Error while deleting the agent, ${delresponse.statusCode}, ${delresponse.body}';
      }
    } catch (e) {
      return 'Failed to delete agent data: $e';
    }
  }

  void showTopSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2), // Set the duration
      behavior: SnackBarBehavior.floating, // This will make it float
      margin: EdgeInsets.only(top: 80), // Adjust margin to push it to the top
    );

    if (mounted){
    ScaffoldMessenger.of(context).showSnackBar(snackBar); }
  }

  void confirmDelete(BuildContext context, String agentId) async {
    String result = await deleteAgents(agentId);
    print(result);
    fetchAgents();

    // Future.delayed(Duration(milliseconds: 100), () {
    //   if (mounted) {
    //     showTopSnackbar(context, result);
    //     fetchAgents();
    //   }
    // });

  }
  
  void insertAgent(String agent_name, String display_name) async {
    String workspaceId = 'ws-lzqngybb-29q1f2m2';
    final insert_url = Uri.parse('https://app-haiva.gateway.apiplatform.io/v1/insertHaivaAgentInfo?workspace-id=$workspaceId');

    final headers = {
      'Content-Type' : 'application/json'
    };

    final requestBody = {
      'name' : agent_name,
      'description' : display_name,
      'type' : 'Analytics'
     };

    try {
      final insertResp = await http.post(
          insert_url,
          headers: headers,
          body: jsonEncode(requestBody)
      ,);

      if(insertResp.statusCode == 200 || insertResp.statusCode == 201){
        print('agent created successful, ${insertResp.body} ');

      }
    }
    catch(e){
      print('Failed to insert agent data: $e');
    }


  }
  

  void showForm(BuildContext context){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('New Agent'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              TextField( 
                controller: _agentName,
                decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Agent Name'
              ),),
              TextField(
                controller: _displayName,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Description'
                )
              ),
              TextButton(onPressed: (){
                String agent_name = _agentName.text;
                String display_name = _displayName.text;
                insertAgent(agent_name, display_name);
                Navigator.of(context).pop();
              }, child: Text('Create'),),
            ],
          )
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAgents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agents',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF19427D),
      ),
      body: agents.isNotEmpty
          ? ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                // Access the specific field from each agent, e.g., 'name'
                final agentName = agents[index]['name'] ??
                    'haiva'; // Fallback to 'Unnamed Agent' if 'name' is null
                final imageUrl = agents[index]['agent_configs']?['image'] ?? '';
                final agentImage = (imageUrl.isNotEmpty)
                    ? NetworkImage(imageUrl)
                    : AssetImage('images/profile.png') as ImageProvider;

                return Card(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: agentImage,
                      ),
                      SizedBox(width: 10),
                      Text(agentName), // Display the agent's name
                      Spacer(),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.mode_edit_outline_outlined),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          agent_edit(agentName: agentName)));
                            },
                          ),
                          IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Delete Agent'),
                                      content: Text(
                                          'Press Confirm to delete the agent'),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              confirmDelete(context,
                                                  agents[index]['agent_id']);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Confirm'))
                                      ],
                                    );
                                  },
                                );
                              })
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: agents.length,
            )
          : Center(
              child:
                  CircularProgressIndicator()), // Show loading spinner while data is being fetched
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF19427D),
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(onPressed: (){
// stay in the agent_page
          }, icon: Icon(Icons.smart_toy_outlined, color: Colors.white,)),
          IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => database_page()));
          }, icon: Icon(Icons.storage_outlined, color: Colors.white),
          tooltip: 'Database Connections',),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => file_storage()));
          }, icon: Icon(Icons.folder, color: Colors.white,),
          tooltip: 'File Storage'),
          Container(
            child: FloatingActionButton(onPressed: (){

              showForm(context);
            }, child: Icon(Icons.add), tooltip: 'Create a new agent',),
          ),
        ],),
      ),
    );
  }
}
