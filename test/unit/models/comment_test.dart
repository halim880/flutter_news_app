import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/models/author.dart';
import 'package:news_app/models/comment.dart';



void main() {
  test('comment map can be converted to comment object', (){
    Map<String, dynamic> commentMap = {
        "comment_id": 18,
        "comment_body": "Recusandae illum magni eos voluptate voluptate odio rem sunt quia labore sapiente qui laborum aut dolores reiciendis voluptatibus et.",
        "author": {
            "author_id": 4,
            "first_name": "Jerrold",
            "last_name": "Abshire",
            "avatar": "https://via.placeholder.com/100x100.png/007755?text=quia",
        }
    };

    Comment comment = Comment.fromJson(commentMap);

    expect(comment.commentId, 18);
    expect(comment.commentBody, 'Recusandae illum magni eos voluptate voluptate odio rem sunt quia labore sapiente qui laborum aut dolores reiciendis voluptatibus et.');
    expect(comment.author.runtimeType, Author);
    expect(comment.author.firstName, "Jerrold");
    expect(comment.author.lastName, "Abshire");
    expect(comment.author.avatar, "https://via.placeholder.com/100x100.png/007755?text=quia");
  });
}