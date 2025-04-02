import 'package:escape_room/boxStyle.dart';
import 'package:flutter/material.dart';

const List<Widget> categories = <Widget>[Text('인기순') ,Text("가격순") , Text("테마별")];


class category extends StatelessWidget {
  const category({super.key});

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: categoryPage(),
    );
  }
}

TextEditingController searchEditingController = TextEditingController();

class categoryPage extends StatefulWidget{
  const categoryPage({super.key});

  @override
  State<categoryPage> createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage> {

   List<bool> isSelected = [false,false,false];

   void toggleSelected(int index){
    setState(() {
      isSelected= List<bool>.from(isSelected);
      isSelected[index] = !isSelected[index];
    });
   }


  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        TextFieldStyle(
          hintText: "검색어를 입력하세요",
          prefixIcon: Icons.search_rounded,
          controller: searchEditingController,
        ),
        ToggleButtons(
          children: categories,
          isSelected: isSelected,
          onPressed: toggleSelected,
          fillColor: Colors.grey,
          selectedColor: Colors.white,
          selectedBorderColor: Colors.black,
        ),
        SizedBox(height: 30),
        Expanded( 
          
          child: GridView.count(
            padding: EdgeInsets.all(8),
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: List.generate(8, (i) => ClipRRect(
              borderRadius: BorderRadius.circular(8), 
              child: Image.asset(
                "assets/images/방탈출${i}.png",
                fit: BoxFit.cover,
              ),
            )),
          ),
        ),
      ],
    ),
  );
}
}