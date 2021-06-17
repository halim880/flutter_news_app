

import 'package:news_app/models/category.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/utils/api_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryService {
  
  Future<List<Category>> fetchAllCategory() async{
    Uri url = ApiUtil.getAllCategoryUrl();

    List<Category> categories = [];

    var response = await http.get(url, headers: ApiUtil.headers());
    if (response.statusCode==200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for(var item in body['data']){
        Category category = Category.fromJson(item);
        categories.add(category);
      }
    }

    return categories;
  }

  Future<List<Post>> fetchPostsForCategory(String categoryId) async{
    List<Post> posts = [];

    Uri url = ApiUtil.postsForCategoryUrl(categoryId);
    var response = await http.get(url, headers: ApiUtil.headers());
    var body = jsonDecode(response.body);

    for(Map<String, dynamic> map in body['data']){
      Post post = Post.fromJson(map);
      posts.add(post);
    }
    return posts;
  }
}