import 'package:escape_room/main.dart';
import 'package:escape_room/mypage.dart';
import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/escape.png"),
            ),

            accountEmail: Text('youngjun.choi@gaubiz.com'),
            accountName: Text("최영준"),
          ),
          ListTile(
            leading: const Icon(Icons.home_rounded),
            title: const Text('마이페이지'),
            onTap:
                () => {
                 
                },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_rounded),
            title: const Text('예약'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_rounded),
            title: const Text('찜'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.star_rounded),
            title: const Text('리뷰'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => login()),
                  ),
                },
          ),
        ],
      ),
    );
  }
}
