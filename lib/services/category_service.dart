

import 'package:news_app/models/category.dart';
import 'package:news_app/utils/api_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryService {
  
  Future<List<Category>> fetchAllCategory() async{
    Uri url = Uri.parse(ApiUtil.baseUrl + ApiUtil.allCategories);

    Map<String, String> headers = {
      'Accept' : 'application/json',
    };
    List<Category> categories = [];

    var response = await http.get(url, headers: headers);
    if (response.statusCode==200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      for(var item in body['data']){
        Category category = Category.fromJson(item);
        categories.add(category);
      }
    }

    return categories;
  }
}