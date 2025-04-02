import 'package:flutter/material.dart';

class location extends StatelessWidget {
  const location({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: locationPage(),
    );
  }
}

class locationPage extends StatefulWidget {
  const locationPage({super.key});
 @override
  State<locationPage> createState() => _locationPageState();
}

class _locationPageState extends State<locationPage> {

   final Map<String , List<String>> locationDate= {
    "서울": ["강남", "홍대", "종로", "명동"],
    "경기": ["수원", "성남", "고양", "용인"],
    "대구": ["동성로", "수성구", "남구"],
    "부산": ["해운대", "광안리", "서면"],
    "포항": ["영일대", "죽도시장", "오천"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(8),
      child: ListView(
        children: locationDate.keys.map((city){
            return Card(elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionTile(title: Text(city,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            children: locationDate[city]!.map((district){
                return ListTile(
                  title: Text(district),
                  onTap: (){print("$city - $district 선택");},
                );
            }).toList(),),
            );
        }).toList(),
      ),),
    );
  }
}