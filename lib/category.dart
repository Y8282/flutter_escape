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
  String selectedCategory = '인기순';
  String searchQuery = "";
  bool hover = false;
  Map<String, bool> favorite = {};

  late List<Room> filteredRooms;
  @override
  void initState() {
    filteredRooms = getFilterRooms();
    super.initState();
  }

  List<Room> getFilterRooms() {
    List<Room> filtered =
        escapeRooms.where((room) => room.name.contains(searchQuery)).toList();

    if (selectedCategory == "가격순") {
      filtered.sort((a, b) => a.price.compareTo(b.price));
    } else if (selectedCategory == "인기순") {
      filtered.sort((a, b) => a.popularity.compareTo(b.popularity));
    } else if (selectedCategory == "테마별") {
      filtered.sort((a, b) => a.theme.compareTo(b.theme));
    }

    return filtered;
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
                              userProvider.favorite[room.name] ?? false;
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.asset(
                                  (room.image),
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
                                          "이름: ${room.name}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "가격: ${room.price}원",
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
                                      final roomObj = Room(
                                        name: room.name,
                                        price: room.price,
                                        popularity: room.popularity,
                                        theme: room.theme,
                                        image: room.image,
                                      );
                                      userProvider.toggleFavorite(roomObj);
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
