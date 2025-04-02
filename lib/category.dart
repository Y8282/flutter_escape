import 'package:escape_room/boxStyle.dart';
import 'package:flutter/material.dart';

const List<String> categories = ['인기순', "가격순", "테마별"];
TextEditingController searchEditingController = TextEditingController();

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  String selectedCategory = '인기순';
  String searchQuery = "";
  late List<Map<String, dynamic>> filteredRooms;
  @override
  void initState() {
    filteredRooms = getFilterRooms();
    super.initState();
  }

  List<Map<String, dynamic>> escapeRooms = [
    {
      "name": "공포의 방",
      "price": 25000,
      "popularity": 5,
      "theme": "공포",
      "image": "assets/images/방탈출0.png",
    },
    {
      "name": "추리의 방",
      "price": 20000,
      "popularity": 4,
      "theme": "추리",
      "image": "assets/images/방탈출1.png",
    },
    {
      "name": "모험의 방",
      "price": 30000,
      "popularity": 3,
      "theme": "어드벤처",
      "image": "assets/images/방탈출2.png",
    },
    {
      "name": "스릴의 방",
      "price": 35000,
      "popularity": 5,
      "theme": "스릴",
      "image": "assets/images/방탈출3.png",
    },
    {
      "name": "공포의 방",
      "price": 18000,
      "popularity": 2,
      "theme": "공포",
      "image": "assets/images/방탈출4.png",
    },
    {
      "name": "추리의 방",
      "price": 18000,
      "popularity": 1,
      "theme": "추리",
      "image": "assets/images/방탈출5.png",
    },
    {
      "name": "모험의 방",
      "price": 18000,
      "popularity": 3,
      "theme": "어드벤처",
      "image": "assets/images/방탈출6.png",
    },
    {
      "name": "추리의 방",
      "price": 18000,
      "popularity": 5,
      "theme": "추리",
      "image": "assets/images/방탈출7.png",
    },
    {
      "name": "공포의 방",
      "price": 18000,
      "popularity": 5,
      "theme": "공포",
      "image": "assets/images/방탈출8.png",
    },
    {
      "name": "스릴의 방",
      "price": 18000,
      "popularity": 2,
      "theme": "스릴",
      "image": "assets/images/방탈출9.png",
    },
  ];

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
                            Container(
                              color: Colors.black,
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    room["name"],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${room["price"]}원",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
