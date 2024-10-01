import 'package:flutter/material.dart';
import 'agent_file.dart';

class login_page extends StatefulWidget{

  @override
  _login_page createState() => _login_page();
}
class _login_page extends State<login_page> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF19427D),

      body: Stack(
        children: [
          Container(decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/sample_image.jpeg'),
            fit: BoxFit.cover)
          )),
          Align(
            //alignment: Alignment.center,

            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              height: 400,
              width: 400,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      //SizedBox(width: 20),
                      Image(
                        image: AssetImage('images/profile.png'),
                        //alignment: Alignment(5,0),
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        'haiva',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                            fontSize: 20),
                      ),
                    ],
                  ),
                  TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: _textEditingController1,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password', border: OutlineInputBorder()),
                  )
                  //alignment: Alignment.center
                  ,
                  ElevatedButton(
                      onPressed: () {
                        String username = _textEditingController.text;
                        String password = _textEditingController1.text;
                        print('Pressed Submit Button');
                        //print(_verifyUser(username, password));
                        if (username == '' && password == ''){
                          print('Logged in successfully');
                          Navigator.push(context, MaterialPageRoute(builder: (context) => agent_page()));
                        }
                        else{
                          print('Incorrect Username or Password');
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Incorrect Username or Password')));

                        }
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => agent_page()));
                      },
                      child: Text('Submit'))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
          ),
        ],
      ),
    );
  }


}
