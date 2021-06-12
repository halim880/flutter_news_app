import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/services/category_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
        title: const Text('News app'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder(
          future: categoryService.fetchAllCategory(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.hasData) {
              return categoryList(snapshot.data);
            }
            return const Text('hello');
          }
        ),
      ),
    );
  }

  Widget categoryList(List<Category> categories){
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
            child: Text(categories[index].title),
          ),
        );
      },
    );
  }
}