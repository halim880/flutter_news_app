
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/models/author.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/models/post.dart';
// import 'package:test/test.dart'; 


void main() {
  test('post can be created', (){
    Map<String, dynamic> map = {
            "post_id": 11,
            "post_title": "Sint vero commodi natus velit adipisci delectus.",
            "post_content": "Voluptates ipsam perspiciatis omnis odit. Et et earum sint aperiam earum amet rerum cumque. Accusamus modi consequatur consectetur. Voluptas numquam iste et voluptatem.",
            "post_type": "image",
            "comments": [
                {
                    "comment_id": 18,
                    "comment_body": "Officia aut voluptatem ab esse exercitationem.",
                    "author": {
                        "author_id": 3,
                        "first_name": "Giuseppe",
                        "last_name": "Ritchie",
                        "avatar": "https://via.placeholder.com/100x100.png/0011bb?text=temporibus"
                    }
                },
                {
                    "comment_id": 50,
                    "comment_body": "Non recusandae odit iste culpa asperiores velit vel at numquam id laboriosam.",
                    "author": {
                        "author_id": 4,
                        "first_name": "Joanie",
                        "last_name": "Cruickshank",
                        "avatar": "https://via.placeholder.com/100x100.png/005533?text=veritatis"
                    }
                }
            ],
            "category": {
                "category_id": 3,
                "category_title": "Inventore et reprehenderit voluptas earum ullam.",
                "category_color": "#6caa6b"
            },
            "post_meta": null,
            "updated_at": "2021-06-10T10:42:13.000000Z",
            "author": {
                        "author_id": 4,
                        "first_name": "Jerrold",
                        "last_name": "Abshire",
                        "avatar": "https://via.placeholder.com/100x100.png/007755?text=quia",
                        "email": "author@gmail.com"
                    },
            "images": [

            ],
            "tags": []
        };

    Post post = Post.fromJson(map);

    expect(post.id, 11);
    expect(post.title, "Sint vero commodi natus velit adipisci delectus.");
    expect(post.content, "Voluptates ipsam perspiciatis omnis odit. Et et earum sint aperiam earum amet rerum cumque. Accusamus modi consequatur consectetur. Voluptas numquam iste et voluptatem.");
    expect(post.type, 'image');
    // expect(post.comments, []);
    expect(post.author.runtimeType, Author);
    expect(post.category.runtimeType, Category);
    expect(post.images, []);
    expect(post.tags, []);
  });
}