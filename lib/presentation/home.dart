import 'package:flutter/material.dart';
import 'package:tarea6/views/ageGender.dart';
import 'package:tarea6/views/contactMe.dart';
import 'package:tarea6/views/genderPerson.dart';
import 'package:tarea6/views/toolimage.dart';
import 'package:tarea6/views/universityCountry.dart';
import 'package:tarea6/views/news.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedIndex = 0;
  final views =[
    // genderPerson()
    ToolboxPage(),
    GenderScreen(),
    AgePage(),
    UniversitiesPage(),
    NewsPage(),
    contactMe()
    
  
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (value){
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Herramientas',
            icon: Icon(Icons.slideshow),
          ),
          BottomNavigationBarItem(
            label: 'Genero predicción',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Edad predicción',
            icon: Icon(Icons.numbers),
          ),
          BottomNavigationBarItem(
            label: 'Universidades',
            icon: Icon(Icons.school_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Noticias',
            icon: Icon(Icons.newspaper),
          ),
          BottomNavigationBarItem(
            label: 'Acerca De',
            icon: Icon(Icons.info_rounded),
          )
        ],
      ),
    );
  }
}