import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/screans/category_posts.dart';
import 'package:news_app/services/category_service.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({ Key? key }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

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
        title: const Text('All Categories'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder(
          future: categoryService.fetchAllCategory(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return _loading();
              case ConnectionState.waiting:
                return _loading();
              case ConnectionState.none:
                return _error("No Connection has been made.");
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return _error(snapshot.error.toString());
                }

                if (snapshot.hasData) {
                  return _categoryList(snapshot.data, context);
                }
            }
            return Container();
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

  Widget _categoryList(List<Category> categories, BuildContext context){
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index){
        return Card(
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  categories[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: categories[index].color),
                
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryPosts(
                  categoryId: categories[index].id.toString())
                ));
              },
            ),
          );
          
      },
    );
  }
}