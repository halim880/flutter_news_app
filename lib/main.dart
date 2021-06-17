import 'package:flutter/material.dart';
import 'package:news_app/screans/Categories_list.dart';
import 'package:news_app/screans/home_screen.dart';
import 'package:news_app/utils/colors.dart' as style;

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: style.Colors.primaryColor),
      routes: {
        '/' : (context) => const HomeScreen(),
        '/categories': (context) => const CategoryList(),
      },
    );
  }
}