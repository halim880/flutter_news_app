import 'package:flutter/cupertino.dart';

class Category {
    Category(
        this.id,
        this.title,
        this.color,
    );

    int id;
    String title;
    Color color;

    Category.fromJson(Map<String, dynamic> json):
        id = json["category_id"],
        title = json["category_title"], 
        color = Color(int.parse(json["category_color"].substring(1, 7), radix: 16) + 0xFF000000);
        
    Map<String, dynamic> toJson() => {
        "category_id": id,
        "category_title": title,
        "category_coror": color,
    };
}