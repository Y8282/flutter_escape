import 'package:escape_room/boxStyle.dart';
import 'package:escape_room/useProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

const List<String> categories = ['인기순', "가격순", "테마별"];
TextEditingController searchEditingController = TextEditingController();

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  List<Map<String, dynamic>> escapeRooms = [
    {
      "name": "방탈출",
      "price": 25000,
      "popularity": 5,
      "theme": "공포",
      "image": "assets/images/방탈출0.png",
    },
    {
      "name": "이스케이프룸",
      "price": 20000,
      "popularity": 4,
      "theme": "추리",
      "image": "assets/images/방탈출1.png",
    },
    {
      "name": "전국 방탈출",
      "price": 30000,
      "popularity": 3,
      "theme": "어드벤처",
      "image": "assets/images/방탈출2.png",
    },
    {
      "name": "방탈출고사",
      "price": 35000,
      "popularity": 5,
      "theme": "스릴",
      "image": "assets/images/방탈출3.png",
    },
    {
      "name": "인스타 방탈출",
      "price": 18000,
      "popularity": 2,
      "theme": "공포",
      "image": "assets/images/방탈출4.png",
    },
    {
      "name": "미로 방탈출",
      "price": 18000,
      "popularity": 1,
      "theme": "추리",
      "image": "assets/images/방탈출5.png",
    },
    {
      "name": "큐브 방탈출",
      "price": 18000,
      "popularity": 3,
      "theme": "어드벤처",
      "image": "assets/images/방탈출6.png",
    },
    {
      "name": "엑셀 방탈출",
      "price": 18000,
      "popularity": 5,
      "theme": "추리",
      "image": "assets/images/방탈출7.png",
    },
    {
      "name": "자물쇠 방탈출",
      "price": 18000,
      "popularity": 5,
      "theme": "공포",
      "image": "assets/images/방탈출8.png",
    },
    {
      "name": "장기밀매",
      "price": 18000,
      "popularity": 2,
      "theme": "스릴",
      "image": "assets/images/방탈출9.png",
    },
  ];

  String selectedCategory = '인기순';
  String searchQuery = "";
  bool hover = false;
  Map<String, bool> favorite = {};

  late List<Map<String, dynamic>> filteredRooms;
  @override
  void initState() {
    filteredRooms = getFilterRooms();

    super.initState();
  }

  //검색하기
  List<Map<String, dynamic>> getFilterRooms() {
    List<Map<String, dynamic>> filterRooms =
        escapeRooms
            .where((room) => room["name"].contains(searchQuery))
            .toList();

    if (selectedCategory == "가격순") {
      filterRooms.sort((a, b) => a["price"].compareTo(b["price"]));
    } else if (selectedCategory == "인기순") {
      filterRooms.sort((a, b) => b["popularity"].compareTo(a["popularity"]));
    } else if (selectedCategory == "테마별") {
      filterRooms.sort((a, b) => a["theme"].compareTo(b["theme"]));
    }

    return filterRooms;
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchQuery = value;
      filteredRooms = getFilterRooms(); // 상태 변경 시 업데이트
    });
  }

  void _favorite(String roomName) {
    setState(() {
      favorite[roomName] = !(favorite[roomName] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            TextFieldStyle(
              onChanged: _onSearchChanged,
              hintText: "검색어를 입력하세요",
              prefixIcon: Icons.search_rounded,
              controller: searchEditingController,
            ),

            SegmentedButton(
              segments:
                  categories
                      .map(
                        (category) => ButtonSegment(
                          value: category,
                          label: Text(category),
                        ),
                      )
                      .toList(),

              selected: {selectedCategory},
              onSelectionChanged: (newSelection) {
                setState(() {
                  selectedCategory = newSelection.first;
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  return states.contains(WidgetState.selected)
                      ? Colors.blueAccent
                      : Colors.grey.shade200;
                }),
                foregroundColor: WidgetStateProperty.all(Colors.black),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(8),
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
                children:
                    getFilterRooms().map((room) {
                      return Consumer<UserProvider>(
                        builder: (context, userProvider, child) {
                          bool isFavorite =
                              userProvider.favorite[room["name"]] ?? false;
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.asset(
                                  room["image"],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Positioned(
                                  bottom: 10,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          "이름: ${room["name"]}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "가격: ${room["price"]}원",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0.5,
                                  child: IconButton(
                                    onPressed: () {
                                      userProvider.toggleFavorite(room["name"]);
                                    },
                                    icon:
                                        isFavorite
                                            ? Icon(
                                              Icons.favorite,
                                              color: Colors.pink,
                                            )
                                            : Icon(
                                              Icons.favorite_outline,
                                              color: Colors.black,
                                            ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
