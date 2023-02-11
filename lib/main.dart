import 'package:crud/screen/LopPage.dart';
import 'package:crud/screen/SinhVienPage.dart';
import 'package:crud/screen/TruongPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD 3 thực thể',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home: const Main(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int curenindex = 0;

  final tabs = [
      const TruongPage(),
      const LopPage(),
      const SinhVienPage(),
  ];
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
        body: tabs[curenindex],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black87,
          items: const [
           
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Trường'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.class_),
              label: 'Lớp'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Sinh Viên'
            ),
          ],
          currentIndex: curenindex,
          onTap: (index){
            setState(() {
              curenindex =  index;
            });
          },
        ),
    );
  }
}