import 'package:flutter/material.dart';
import 'package:news_app/models/comment.dart';
import 'package:news_app/models/post.dart';

class SinglePost extends StatefulWidget {
  Post post;
  SinglePost(this.post, { Key? key }) : super(key: key);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar( 
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.post.getImage(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index){
                if (index==0) {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(widget.post.content,
                      style: TextStyle(
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }
                else {
                  return _commentWidget(widget.post.comments![index]);
                }
              },
              childCount: widget.post.comments!.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _commentWidget(Comment comment){
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(comment.commentBody),
            Text(comment.author.fullName())
          ],
        ))
    );
  }
}