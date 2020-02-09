import 'package:flutter/material.dart';
import 'package:wechat_ui/screens/home_screen.dart';
//import 'package:flutter_social_ui/widgets/Curve_clipper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Image(
                  height: MediaQuery.of(context).size.height/2.5,//mediaQuery sets the image according to the size of screen
                  width: double.infinity,//takes the entire width of container
                  image: AssetImage("assets/images/login_background.jpg"),
                  fit: BoxFit.cover,
                ),
            Text("WECHAT",
            style: TextStyle(
              fontSize: 34.0,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 10.0,
            )),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:15.0),
                  hintText: "Username",
                  fillColor: Colors.white10,
                  prefixIcon: Icon(Icons.account_box,size:30.0)
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:15.0),
                  hintText: "Password",
                  fillColor: Colors.white10,
                  prefixIcon: Icon(Icons.lock,size:30.0)
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 10.0,),
            GestureDetector(
              onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen())),
                          child: new Container(
                margin: EdgeInsets.symmetric(horizontal: 60.0),
                alignment: Alignment.center,// on giving this the container got its size later
                height: 45.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: new Text("login", //without alignment the size is according to the text
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ) ,),
              ),
            ), 
            Expanded(
                          child: Align(
                  alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                    onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      
                    ),
                      alignment: Alignment.center,
                      
                      height: 60,
                      child: Text("Don't have an account? Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),),
                    ),
                  ),
                ),
            )
          ],
        
        )
        ),
      ),
    );
  }
}