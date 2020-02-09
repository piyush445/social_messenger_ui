import 'package:flutter/material.dart';
import 'package:wechat_ui/data/data.dart';
import 'package:wechat_ui/screens/home_screen.dart';
import 'package:wechat_ui/screens/login_screen.dart';
import 'package:wechat_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  Widget _bulidDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                height: 200.0,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 3.0, color: Theme.of(context).primaryColor),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(currentUser.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        )),
                  ],
                ),
              )
            ],
          ),
          _bulidDrawerOption(
            Icon(Icons.dashboard),
            "Home",
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ), 
          ),
          _bulidDrawerOption(Icon(Icons.chat), "Chats", () {}),
          _bulidDrawerOption(Icon(Icons.location_on), "Map", () {}),
          _bulidDrawerOption(
            Icon(Icons.account_circle),
            "Your Profile",
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(user: currentUser,),
              ),
            ),
          ),
          _bulidDrawerOption(Icon(Icons.settings), "Settings", () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _bulidDrawerOption(
                Icon(Icons.directions_run),
                "Log Out",
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
