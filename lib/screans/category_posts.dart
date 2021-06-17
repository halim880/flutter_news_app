import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/services/category_service.dart';
import 'package:news_app/widgets/post_card.dart';


class CategoryPosts extends StatefulWidget {
  const CategoryPosts({ Key? key, required this.categoryId }) : super(key: key);

  final String categoryId;

  @override
  _CategoryPostsState createState() => _CategoryPostsState();
}

class _CategoryPostsState extends State<CategoryPosts> {

  CategoryService categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    categoryService.fetchAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: categoryService.fetchPostsForCategory(widget.categoryId),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return _loading();
              case ConnectionState.waiting:
                return _loading();
              case ConnectionState.none:
                return _error("No Connection made.");
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return _error(snapshot.error.toString());
                }

                if (snapshot.hasData) {
                  return _postsList(snapshot.data);
                }
            }
            return Card();
          }
        ),
      ),
    );
  }

  Widget _error(String error){
    return Container(
      child: Center(
        child: Text(error, style: const TextStyle(color: Colors.red),)
      ),
    );
  }

  Widget _loading(){
    return Container(
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _postsList(List<Post>? posts){
    return ListView.builder(
      itemCount: posts!.length,
      itemBuilder: (BuildContext context, int index){
        return PostCard(post: posts[index]);
      }
    );
  }
}