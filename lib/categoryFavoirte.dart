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
        final favoriteRooms = userProvider.favoriteCategories;

        if(favoriteRooms.isEmpty){
          return Scaffold(
            body: Center(
              child: Text("즐겨찾기한 방탈출이 없습니다"),
            ),
          );
        }
        return Scaffold(
          body: (ListView.builder(
            itemCount: userProvider.favoriteCategories.length,
            itemBuilder: (context, index) {
              final room = favoriteRooms[index];
              return ListTile(
                leading: Image.asset(room.image,width: 50,height: 50,),
              );
            },
          )),
        );
      },
    );
  }
}
