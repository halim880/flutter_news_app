
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:news_app/models/author.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/models/comment.dart';
import 'package:news_app/models/post_image.dart';
import 'package:news_app/models/tag.dart';


class Post {
  int id;
  String title;
  String content;
  String type;
  Author author;
  Category category;
  List<Comment>? comments;
  dynamic meta;
  DateTime? updatedAt;
  List<PostImage>? images;
  List<Tag>? tags;


    Post(
        this.id,
        this.title,
        this.content,
        this.type,
        this.category,
        this.author,
        
        {
          this.comments,
          this.meta,
          this.updatedAt,
          this.images,
          this.tags,
      }
    );


    Post.fromJson(Map<String, dynamic> json):
      id = json["post_id"],
      title = json["post_title"],
      content = json["post_content"],
      type = json["post_type"],
      comments = List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
      category = Category.fromJson(json["category"]),
      meta = json["post_meta"],
      updatedAt = DateTime.parse(json["updated_at"]),
      author = Author.fromJson(json["author"]),
      images = List<PostImage>.from(json["images"].map((x) => PostImage.fromJson(x))),
      tags = List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x)));

  String getFeaturedImage(){
    return images![0].imageUrl;
  }

  String authorName(){
    return author.fullName();
  }

  String getUpdatedAt(){
    return "5 may, 2001. 2:05 am";
  }

  ImageProvider getImage(){
    return const ExactAssetImage('assets/images/placeholder.jpg');
    // if(post.getFeaturedImage() == null) {
    // }
    // return NetworkImage(getFeaturedImage());
  }
}
