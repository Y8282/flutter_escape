import 'package:escape_room/mainpage.dart';
import 'package:escape_room/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
runApp(MyApp())
;}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: login());
  }
}

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("방탈출"),
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset("assets/images/escape.png"),
                ),
                SizedBox(height: 8),
                SizedBox(height: 10),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: TextField(                           
                            decoration: InputDecoration(
                              hintText: "아이디",
                              prefixIcon: Icon(Icons.account_circle_rounded),
                              suffixIcon: Icon(Icons.close),
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          child: TextField(
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "비밀번호",
                              prefixIcon: Icon(Icons.lock_clock_rounded),
                              suffixIcon: Icon(Icons.close),
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("자동 로그인"), Text("아이디 저장")],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(350, 40),
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>mainPage()));
                          },
                          child: Text(
                            "로그인",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.blueAccent,
                        ),
                        onPressed: () {
                          
                          Navigator.push(context, MaterialPageRoute(builder : (_)=>
                          Signup()
                          ));
                          
                        },
                        child: Text(
                          "아이디가 없으신가요?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
        
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          print("아이디 비밀번호 찾기 클릭");
                        },
                        child: Text("ID/PW", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
  }
