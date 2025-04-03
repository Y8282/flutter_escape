import 'package:escape_room/categoryFavoirte.dart';
import 'package:escape_room/home.dart';
import 'package:flutter/material.dart';
import 'package:escape_room/Drawer.dart';
import 'package:escape_room/category.dart';
import 'package:escape_room/location.dart';
import 'package:escape_room/mypage.dart';
import 'package:escape_room/useProvider.dart';
import 'package:provider/provider.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int currentIndex = 0;
  bool isSeleted = false;
  void _favorite() {
    setState(() {
      isSeleted = !isSeleted;
      if (!isSeleted) {
        currentIndex = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: myDrawer(),
      appBar: AppBar(
        title: Text("현재시각 "),

        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _favorite();
              pageProvider.changePage(1);
            },
            icon:
                isSeleted
                    ? Icon(Icons.favorite, color: Colors.pink)
                    : Icon(Icons.favorite_outline, color: Colors.black),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.mail_outline)),
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return Text("${userProvider.userName} 님 환영합니다");
            },
          ),
        ],
      ),
      body:
          isSeleted
              ? categoryFavorite()
              : IndexedStack(
                index: pageProvider.currentIndex,
                children: [home(), category(), location(), mypage()],
              ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageProvider.currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        selectedFontSize: 15,
        showUnselectedLabels: true,
        onTap: (index) {
          pageProvider.changePage(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'mypage',
          ),
        ],
      ),
    );
  }
}
