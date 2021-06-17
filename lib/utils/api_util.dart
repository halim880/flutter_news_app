

class ApiUtil {
  // static const String baseUrl = "http://127.0.0.1:8000/api";
  
  static const String baseUrl = "https://laravel-flutter-news.herokuapp.com/api";

  static const String allCategories ="/categories";
  static const String recentPosts ="/posts";

  static Uri postsForCategoryUrl(String categoryId){
    return Uri.parse(baseUrl + "/category/" + categoryId+ "/posts");
  }

  static Uri getRecentPostsUrl(){
    return Uri.parse(baseUrl + recentPosts);
  }

  static Uri getAllCategoryUrl(){
    return Uri.parse(ApiUtil.baseUrl + ApiUtil.allCategories);
  }
  static Map<String, String> headers(){
    return {
      'Accept' : 'application/json',
    };
  }

}