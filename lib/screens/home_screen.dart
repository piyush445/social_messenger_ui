import 'package:flutter/material.dart';
import 'package:wechat_ui/data/data.dart';
import 'package:wechat_ui/models/user_model.dart';
import 'package:wechat_ui/screens/post_carousel.dart';
import 'package:wechat_ui/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;
  PageController pageController;
  @override
  void initState() {
    super.initState();
    controller = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
      //tabcontoller.index will give the selected tab and we can use that in build method
    );
    pageController=PageController(initialPage: 0,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "WECHAT",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold, 
            letterSpacing: 5.0,
          ),
        ),
        bottom: TabBar(
          indicatorWeight: 3.0,
          controller: controller,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelStyle: TextStyle(fontSize: 13.0),
          labelStyle: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
          tabs: <Widget>[
            Tab(
              text: "Trending",
            ),
            Tab(
              text: "Latest",
            )
          ],
        ),
      ),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
      
      Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
        child: Text(
         "Following",
         style: TextStyle(
           fontSize: 24.0,
           fontWeight: FontWeight.bold,
           letterSpacing: 2.0,
         ),
        ),
      ),
      Container(
        height: 80.0,
        child: ListView.builder(
         scrollDirection: Axis.horizontal,
         itemCount: users.length,
         itemBuilder: (_, int index) {
           User user = users[index];
           return Container(
             margin: EdgeInsets.all(10.0),
             height: 60.0,
             width: 60.0,
             decoration: BoxDecoration(
       shape: BoxShape.circle,
       boxShadow: [
         BoxShadow(
             color: Colors.black87,
             offset: Offset(0, 2),
             blurRadius: 6.0),
       ],
             ),
             child: ClipOval(
       child: Image(
         height: 60.0,
         width: 60.0,
         image: AssetImage(user.profileImageUrl),
         fit: BoxFit.cover,
       ),
             ),
           );
         },
        ),
      ),

      PostsCarousel(
            pageController: pageController,
            title:"post",
            posts:posts,

          ),
            ],
          ),
          drawer:CustomDrawer()
    );
  }
}
