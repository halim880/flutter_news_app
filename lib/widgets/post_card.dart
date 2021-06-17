
import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/screans/single_post.dart';

class PostCard extends StatelessWidget {
  Post post;
  PostCard({ Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SinglePost(post)));
          },
          
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                margin: EdgeInsets.only(right: 16.0),
                child: Image(
                  image: post.getImage(),
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(post.title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 14.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          post.authorName(),
                          style: TextStyle(
                            color: Colors.blueGrey
                          ),
                        
                        ),
                        Text(post.getUpdatedAt(), 
                          style: TextStyle(
                            color: Colors.blueGrey
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}