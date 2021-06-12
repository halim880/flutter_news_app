import 'package:news_app/models/author.dart';

class Comment {
    Comment(
        this.commentId,
        this.commentBody,
        this.author,
    );

    int commentId;
    String commentBody;
    Author author;

    Comment.fromJson(Map<String, dynamic> json):
        commentId = json["comment_id"],
        commentBody = json["comment_body"],
        author = Author.fromJson(json["author"]);

    Map<String, dynamic> toJson() => {
        "comment_id": commentId,
        "comment_body": commentBody,
        "author": author == null ? null : author.toJson(),
    };
}
