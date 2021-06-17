
import 'package:news_app/models/post.dart';
import 'package:news_app/utils/api_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostService {

  Future<List<Post>> fetchRecentPosts() async{
    List<Post> posts = [];

    Uri url = ApiUtil.getRecentPostsUrl();
    var response = await http.get(url, headers: ApiUtil.headers());
    if (response.statusCode==200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for(var item in body['data']){
        Post post = Post.fromJson(item);
        posts.add(post);
      }
    }

    return posts;
  }
}