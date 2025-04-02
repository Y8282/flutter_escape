import 'package:escape_room/category.dart';
import 'package:escape_room/location.dart';
import 'package:escape_room/mypage.dart';
import 'package:escape_room/useProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: hompage());
  }
}

class hompage extends StatefulWidget {
  const hompage({super.key});

  @override
  State<hompage> createState() => _hompageState();
}

class _hompageState extends State<hompage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메인"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.mail_outline)),
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return Text("${userProvider.userName} 님환영합니다");
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [home(), category(), location(), mypage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        selectedFontSize: 15,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
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

  GridView home() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: EdgeInsets.all(8),
      children: List.generate(
        9,
        (i) => ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Container(
            child: Image.asset("assets/images/방탈출${i}.png", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
