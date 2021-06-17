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
      appBar: AppBar(title: Text('News'),),
      body: Column(
        children: [
          Container(  
            width: double.infinity,
            child: Image(
              image: widget.post.getImage(),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(15),
              color: Colors.grey.withAlpha(50),
              child: Text(widget.post.title,
                
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              )
            )
          ),

          Container(
            padding: EdgeInsets.all(15),
            child: Text(widget.post.content,
              style: TextStyle(fontSize: 14),
            ),
          ),
          
        ],
      )
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


/*

CustomScrollView(
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
        */