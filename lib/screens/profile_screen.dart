import 'package:flutter/material.dart';
import 'package:wechat_ui/models/user_model.dart';
import 'package:wechat_ui/screens/post_carousel.dart';
import 'package:wechat_ui/widgets/custom_drawer.dart';
import 'package:wechat_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  PageController _yourPostPageController;
  PageController _favoritePageController;


  @override
  void initState() {
    
    super.initState();
    _yourPostPageController=PageController(initialPage:0,viewportFraction: 0.8);
  _favoritePageController= PageController(initialPage:0,viewportFraction:0.8);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                 clipper: ProfileClipper(),
                                  child: Image(
                    image: AssetImage(widget.user.backgroundImageUrl),
                    height: 270.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => key.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                   
                  child: Container(
                    decoration:BoxDecoration(
                      shape:BoxShape.circle,
                      boxShadow:[
                        BoxShadow(
                             color: Colors.black45,
                             offset: Offset(0,2),
                             blurRadius: 6.0,
                        ),
                        
                      ]


                    ),
                    child: ClipOval(
                        child: Image(
                          height:110.0,
                          width: 110.0,
                          image: AssetImage(widget.user.profileImageUrl),
                          fit: BoxFit.cover,
                          ),
                    ),
                  ),
                ),

              ],
            ),
            Padding(
              padding:  EdgeInsets.all(15.0),
              child: Text(widget.user.name,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing:1.5,
              ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                      Text("Following",
                      style:TextStyle(
      color: Colors.black54,
        fontSize: 22.0, 
                      ),
                      ),
                      SizedBox(height:2.0),
                      Text(widget.user.following.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
               

                  ],
                ),
                 Column(
                  children: <Widget>[
                      Text("Followers",
                      style:TextStyle(
      color: Colors.black54,
        fontSize: 22.0, 
                      ),
                      ),
                      SizedBox(height:2.0),
                      Text(widget.user.followers.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                  ],
                ),
              ],
            ),
            PostsCarousel(pageController:_yourPostPageController,title:"Your Posts",posts:widget.user.posts),
            PostsCarousel(pageController:_favoritePageController,title:"Favorites",posts:widget.user.favorites),
          ],
        ),
      ),
    );
  }
}
