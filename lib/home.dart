import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "올해의 인기상",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(10, (index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade700,
                                  blurRadius: 5.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/방탈출${index}.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 150,
                            child: Text(
                              "${index + 1}등",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                backgroundColor: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("hi"),
            ),

            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("공지사항", style: TextStyle(fontSize: 20)),
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 244, 244, 244),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),

                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide()),
                      ),
                      child: Text("12312312312"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide()),
                      ),
                      child: Text("123123123123"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide()),
                      ),
                      child: Text("123123123123"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
