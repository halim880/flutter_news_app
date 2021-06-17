import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Center(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.teal),
                child: Text("News app", style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                title: Text("Categories"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/categories");
                },
              ),
              ListTile(
                title: Text("Favourited"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/favourited");
                },
              ),
              ListTile(
                title: Text("Settings"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/settings");
                },
              ),
              ListTile(
                title: Text("Login"),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/login");
                },
              ),
            ],
          )
        ),
      );
  }
}