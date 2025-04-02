import 'package:escape_room/boxStyle.dart';
import 'package:escape_room/main.dart';
import 'package:escape_room/mainpage.dart';
import 'package:flutter/material.dart';

TextEditingController nameEditingController = TextEditingController();
TextEditingController passwordEditingController = TextEditingController();
TextEditingController idEditingController = TextEditingController();






class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}


class SignupPage extends StatelessWidget{
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> login()));
        }, icon: Icon(Icons.arrow_back_rounded)),
        title: Text("회원가입"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20),
          child: Column(
            children: [
                 TextFieldStyle(hintText: "이름", prefixIcon: (Icons.badge_rounded), suffixIcon: Icons.close_rounded,  controller: nameEditingController ,autofocus: true,onTap: (){
                  print("이름");
                 }),
                 SizedBox(height: 30,),
                 TextFieldStyle(hintText: "아이디", prefixIcon: (Icons.perm_identity_rounded), suffixIcon: Icons.close_rounded, controller: idEditingController, onTap: (){
                  print("아이디");
                 }),
                 SizedBox(height: 30,),
                  TextFieldStyle(hintText: "비밀번호", prefixIcon: (Icons.lock_rounded), suffixIcon: Icons.close_rounded, controller: passwordEditingController,  obscureText: true ,onTap: (){
                  print("비밀번호");
                 }),
                 SizedBox(height: 20,),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,minimumSize: Size(350, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    )
                  ),
    
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>
                  hompage(),
                  
                  ));}, child: Text("회원가입",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))
                  
            ],         
          ),
        ),   
      );
  }
}