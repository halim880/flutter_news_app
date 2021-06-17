import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:news_app/main.dart';
import 'package:news_app/models/author.dart';
import 'package:news_app/models/post.dart';
// import 'package:test/test.dart'; 


void main() {
  test('Author map can be converted to Author object', (){
    Map<String, dynamic> authorMap = {
        "author_id": 4,
        "first_name": "Jerrold",
        "last_name": "Abshire",
        "avatar": "https://via.placeholder.com/100x100.png/007755?text=quia",
    };

    Author author = Author.fromJson(authorMap);

    expect('Jerrold', author.firstName);
    expect('Abshire', author.lastName);
    expect('https://via.placeholder.com/100x100.png/007755?text=quia', author.avatar);
  });
}