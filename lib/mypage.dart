import 'package:escape_room/main.dart';
import 'package:flutter/material.dart';

class mypage extends StatelessWidget {
  const mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/escape.png",
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "최영준",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => login()),
                        );
                      },
                      child: Text(
                        "로그아웃",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2.5,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("예약현황")),
                      ElevatedButton(onPressed: () {}, child: Text("결제")),
                      ElevatedButton(onPressed: () {}, child: Text("리뷰")),
                      ElevatedButton(onPressed: () {}, child: Text("정보 변경")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
