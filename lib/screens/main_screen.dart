import 'package:api_demo/screens/delete_data.dart';
import 'package:api_demo/screens/fetch_data.dart';
import 'package:api_demo/screens/post_data.dart';
import 'package:api_demo/screens/put_data.dart';
import 'package:flutter/material.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int myIndex=0;
  List<Widget> screens=[
    FetchData(),
    PostData(),
    PutData(),
    DeleteData(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              myIndex=index;
            });
          },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.ac_unit,color: Colors.black,),label:"get"),
          BottomNavigationBarItem(icon: Icon(Icons.abc_rounded,color: Colors.black,),label: "post"),
          BottomNavigationBarItem(icon: Icon(Icons.public,color: Colors.black,),label: "put"),
          BottomNavigationBarItem(icon: Icon(Icons.delete,color: Colors.black,),label: "delete")
        ],
      ),
    );
  }
}
