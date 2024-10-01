import 'package:flutter/material.dart';
import 'package:sample_app/login_page.dart';
import 'login_page.dart';


class homePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //backgroundColor: Color(0xFF19427D),

    //   body: Stack(//mainAxisAlignment: MainAxisAlignment.center,
    //     //crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [ //Center( child: Image(image: AssetImage('images/profile.png'),
    //     //   height: 50,
    //     //   width: 50
    //     // )),
    //     //   SizedBox(height: 60,),
    //       Center( child: Image(image: AssetImage('images/sample_image.jpeg')),
    //   //height: 400,
    //   //width: 400,
    //   //alignment: Alignment.center,
    //   ),
    //   Align(
    //     alignment: Alignment.bottomCenter,
    //   heightFactor:16,
    //
    //   child: ElevatedButton(
    //   onPressed: (){
    //     print("Login Button Pressed");
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => login_page()));
    // }, child: Text('Login'),
    //   ),),
    //   //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    //   // }, child: null,)
    //   ],),
    // );

    body: LayoutBuilder(builder: (context, constraints){
      return Container(
    width: constraints.maxWidth,
    height: constraints.maxHeight,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('images/sample_image.jpeg'),
    fit: BoxFit.cover,
    ),
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image(image: AssetImage('images/profile.png'),
      height: 60,
      width: 60,
        ),
    SizedBox(height: 30,),
    Text('Welcome to Haiva!!',
    style: TextStyle(
    fontSize: 24,
    color: Color(0xFF19427D)
    ),),
    SizedBox(
    height: 20,
    ),
    ElevatedButton(onPressed: (){
      print("Login Button Pressed");
      Navigator.push(context, MaterialPageRoute(builder: (context) => login_page()));
    }
    , child: Text('Login',
        style: TextStyle(
          color: Colors.white
        ),),
      style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent, )
    )
        ],
      ),
    );}));
  }
}