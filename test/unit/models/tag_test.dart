

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/models/tag.dart';



void main() {
  test('Tag map can be converted to Tag object', (){
    Map<String, dynamic> tagMap = {
      "tag_id": 3,
      "tag_name": "Computer Science",
    };

    Tag tag = Tag.fromJson(tagMap);

    expect(tag.tagId, 3);
    expect(tag.tagName, 'Computer Science');
  });
}