import 'package:flutter/material.dart';

class Room {
  final name;
  final price;
  final popularity;
  final theme;
  final image;

  Room({
    required this.name,
    required this.price,
    this.popularity,
    required this.theme,
    required this.image,
  });
}

final List<Room> escapeRooms = [
  Room(
    name: "방탈출",
    price: "25000",
    popularity: "5",
    theme: "공포",
    image: "assets/images/방탈출0.png",
  ),
  Room(
    name: "이스케이프룸",
    price: "20000",
    popularity: "4",
    theme: "추리",
    image: "assets/images/방탈출1.png",
  ),
  Room(
    name: "전국 방탈출",
    price: "30000",
    popularity: "	3",
    theme: "어드벤처",
    image: "assets/images/방탈출2.png",
  ),
  Room(
    name: "방탈출고사",
    price: "35000",
    popularity: "5",
    theme: "스릴",
    image: "assets/images/방탈출3.png",
  ),
  Room(
    name: "인스타 방탈출",
    price: "18000",
    popularity: "2",
    theme: "공포",
    image: "assets/images/방탈출4.png",
  ),
  Room(
    name: "	미로 방탈출",
    price: "15000",
    popularity: "1",
    theme: "추리",
    image: "assets/images/방탈출5.png",
  ),
  Room(
    name: "	큐브 방탈출",
    price: "21000",
    popularity: "3",
    theme: "어드벤처",
    image: "assets/images/방탈출6.png",
  ),
  Room(
    name: "	엑셀 방탈출",
    price: "118000",
    popularity: "5",
    theme: "추리",
    image: "assets/images/방탈출7.png",
  ),
  Room(
    name: "자물쇠 방탈출",
    price: "28000",
    popularity: "5",
    theme: "공포",
    image: "assets/images/방탈출8.png",
  ),
  Room(
    name: "	장기밀매",
    price: "218000",
    popularity: "2",
    theme: "스릴",
    image: "assets/images/방탈출9.png",
  ),
];

class UserProvider extends ChangeNotifier {
  //검색하기
  List<Room> get getFilterRooms =>
      escapeRooms.where((room) => favorite[room.name] == true).toList();

  String _userName = '';
  String get userName => _userName;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  Map<String, bool> favorite = {};
  List<Room> favoriteCategories = [];
  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void toggleFavorite(Room room) {
    if (favoriteCategories.any((r) => r.name == room.name)) {
      favoriteCategories.removeWhere((r) => r.name == room.name);
    } else {
      favoriteCategories.add(room);
    }
    print(
      "갯수 : ${favoriteCategories.length}"
    );
    for(var room in favoriteCategories){
        print("이름 : ${room.name}" + "${room.price}");
    }


    favorite[room.name] = !(favorite[room.name] ?? false);

    notifyListeners();
  }

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
