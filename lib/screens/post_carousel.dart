import 'package:flutter/material.dart';
import 'package:wechat_ui/models/post_model.dart';

class PostsCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts; //list of post type objects

  PostsCarousel({this.pageController, this.title, this.posts});

  Widget _buildPost(BuildContext context, int index) {
    final post = posts[index];
    return AnimatedBuilder
    ( animation: pageController,
        builder: (BuildContext context,Widget widget)
        {
          double value=1;
          if(pageController.position.haveDimensions)
          {
            value=pageController.page-index;
            value=(1-(value.abs()*0.35 )).clamp(0.0, 1.0);
          }
          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(value)*400.0,
              child: widget,
            )
             
          );
        },// stack covers the entire skeleton of  its parent
          child: Stack(
        children: <Widget>[
          Container(
            //margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 10.0,
                )
              ],
            ),
            child: ClipRRect (
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                height: 400.0,
                width: 300.0,
                image: AssetImage(post.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              height: 100.0,
              decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  )
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(post.title,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold, 
                      ),
                      overflow: TextOverflow.ellipsis),
                  Text(post.location,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 3.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      Text(
                        post.likes.toString(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.comment,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                      Text(
                        post.comments.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 350.0,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildPost(context, index);
            },
          ),
        )
      ],
    );
  }
}
