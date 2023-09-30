import 'package:flutter/material.dart';
import 'utils/colortheme.dart';
import 'Screens/top_finance.dart';
import 'Screens/top_publish.dart';
import 'Screens/top_science.dart';
import 'Screens/top_sports.dart';
import 'Screens/top_tech.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currindex = 0;
  bool isTap=true;
  var Tabs =[
    TopPublish(),
    TopScience(),
    TopFinance(),
    TopSports(),
    TopTechnology(),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        title: Center(child: Text("TazaKhabar",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),),

      ),

      body: Tabs[currindex],
      backgroundColor: blacktheme,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.blue.shade900,
        currentIndex: currindex,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,),
        onTap: (index){
          currindex=index;
          setState(() {

          });
        },
        selectedItemColor: Colors.grey.shade500,
items: [
  BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: "Science"),
  BottomNavigationBarItem(icon: Icon(Icons.money),label: "Money"),
  BottomNavigationBarItem(icon: Icon(Icons.sports_baseball),label: "Sports"),
  BottomNavigationBarItem(icon: Icon(Icons.mobile_friendly_outlined),label: "Tech"),

],
      ),
    );
  }
}
