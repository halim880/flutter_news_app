// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:news_app/models/author.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/models/comment.dart';
import 'package:news_app/models/image.dart';
import 'package:news_app/models/tag.dart';


class Data {
    Data(
        this.id,
        this.title,
        this.content,
        this.type,
        this.comments,
        this.category,
        this.meta,
        this.updatedAt,
        this.author,
        this.images,
        this.tags,
    );

    int id;
    String title;
    String content;
    String type;
    List<Comment> comments;
    Category category;
    dynamic meta;
    DateTime updatedAt;
    Author author;
    List<Image> images;
    List<Tag> tags;

    Data.fromJson(Map<String, dynamic> json):
        id = json["post_id"],
        title = json["post_title"],
        content = json["post_content"],
        type = json["post_type"],
        comments = List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
        category = Category.fromJson(json["category"]),
        meta = json["post_meta"],
        updatedAt = DateTime.parse(json["updated_at"]),
        author = Author.fromJson(json["author"]),
        images = List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        tags = List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x)));

    Map<String, dynamic> toJson() => {
        "post_id": id,
        "post_title": title,
        "post_content": content,
        "post_type": type,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "category": category.toJson(),
        "post_meta": meta,
        "updated_at": updatedAt.toIso8601String(),
        "author": author == null ? null : author.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    };
}



// class Links {
//     Links({
//         this.first,
//         this.last,
//         this.prev,
//         this.next,
//     });

//     String first;
//     String last;
//     dynamic prev;
//     String next;

//     factory Links.fromJson(Map<String, dynamic> json) => Links(
//         first: json["first"],
//         last: json["last"],
//         prev: json["prev"],
//         next: json["next"],
//     );

//     Map<String, dynamic> toJson() => {
//         "first": first,
//         "last": last,
//         "prev": prev,
//         "next": next,
//     };
// }

// class Meta {
//     Meta({
//         this.currentPage,
//         this.from,
//         this.lastPage,
//         this.links,
//         this.path,
//         this.perPage,
//         this.to,
//         this.total,
//     });

//     int currentPage;
//     int from;
//     int lastPage;
//     List<Link> links;
//     String path;
//     int perPage;
//     int to;
//     int total;

//     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         currentPage: json["current_page"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
//         path: json["path"],
//         perPage: json["per_page"],
//         to: json["to"],
//         total: json["total"],
//     );

//     Map<String, dynamic> toJson() => {
//         "current_page": currentPage,
//         "from": from,
//         "last_page": lastPage,
//         "links": List<dynamic>.from(links.map((x) => x.toJson())),
//         "path": path,
//         "per_page": perPage,
//         "to": to,
//         "total": total,
//     };
// }

// class Link {
//     Link({
//         this.url,
//         this.label,
//         this.active,
//     });

//     String url;
//     String label;
//     bool active;

//     factory Link.fromJson(Map<String, dynamic> json) => Link(
//         url: json["url"] == null ? null : json["url"],
//         label: json["label"],
//         active: json["active"],
//     );

//     Map<String, dynamic> toJson() => {
//         "url": url == null ? null : url,
//         "label": label,
//         "active": active,
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
