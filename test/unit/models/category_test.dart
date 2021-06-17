import 'package:flutter_test/flutter_test.dart';

import 'package:news_app/main.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/models/post.dart';
// import 'package:test/test.dart';


void main() {
  test('Category map can be converted to Category object', (){
    Map<String, dynamic> categoryMap = {
                "category_id": 3,
                "category_title": "Inventore et reprehenderit voluptas earum ullam.",
                "category_color": "#6caa6b"
            };

    Category category = Category.fromJson(categoryMap);

    expect(3, category.id);
    expect(category.title, 'Inventore et reprehenderit voluptas earum ullam.');
  });
}