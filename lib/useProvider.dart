import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _userName = '';
  String get userName => _userName;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  Map<String, bool> favorite = {};
  List<String> favoriteCategories = [];
  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void toggleFavorite(String roomName) {
    if (favoriteCategories.contains(roomName)) {
      favoriteCategories.remove(roomName);
    } else {
      favoriteCategories.add(roomName);
    }
    print(
      "갯수 : ${favoriteCategories.length} + ${favoriteCategories.toString()}",
    );
    favorite[roomName] = !(favorite[roomName] ?? false);

    notifyListeners();
  }

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
