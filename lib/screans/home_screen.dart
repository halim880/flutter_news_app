import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/screans/single_post.dart';
import 'package:news_app/services/post_service.dart';
import 'package:news_app/widgets/drwarWidget.dart';
import 'package:news_app/widgets/error.dart' as widgets;
import 'package:news_app/widgets/loading.dart';
import 'package:news_app/widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PostService postService = PostService();

  @override
  void initState() {
    super.initState();
    postService.fetchRecentPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News app'),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: _homeScreen(),
    );
  }

  Widget _homeScreen(){
    return Container(
        child: FutureBuilder(
          future: postService.fetchRecentPosts(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return const Loading();
              case ConnectionState.waiting:
                return const Loading();
              case ConnectionState.none:
                return const widgets.Error("No connection is made");
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return widgets.Error(snapshot.error.toString());
                }

                if (snapshot.hasData) {
                  return _drawHomeScreen(snapshot.data, context);
                }
            }
            return Container();
          }
        ),
      );
    }

  Widget _drawHomeScreen(List<Post> posts, BuildContext context){
    return Column(
      children: [
        _slider(posts),
        _postsList(posts),
      ],
    );
  }

  Widget _slider(List<Post> posts){
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SinglePost(posts[0])));
            },
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Image(
                    image: ExactAssetImage("assets/images/placeholder.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(15),
                    color: Colors.grey.withAlpha(100),
                    child: Text(posts[0].title,
                      style: TextStyle(fontSize: 18),
                    )
                  )
                ),
              ],
            ),
          ),
    );
  }

  Widget _postsList(List<Post> posts){
    return Flexible(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap: (){},
            child: PostCard(post: posts[index]),
          );
        }
      ),
    );
  }
}