import 'package:escape_room/category.dart';
import 'package:escape_room/useProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class categoryFavorite extends StatelessWidget {
  const categoryFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return Scaffold(
          body: (ListView.builder(
            itemCount: userProvider.favoriteCategories.length,
            itemBuilder: (context, index) {
              Text("hi");
            },
          )),
        );
      },
    );
  }
}
