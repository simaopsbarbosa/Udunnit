import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udunnit',

      theme: ThemeData(primarySwatch: Colors.blue),

      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [TasksScreen(), HomeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFECECEC),
        foregroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 20.0,
        title: Row(
          children: const [
            Icon(Icons.group, color: Colors.deepOrange),
            SizedBox(width: 10),
            Text(
              'Udunnit',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),

          child: Container(color: Color(0xFFC0C0C0), height: 1.0),
        ),
      ),

      body: _screens[_currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFC0C0C0), width: 1.0)),
        ),

        child: BottomNavigationBar(
          iconSize: 32,

          type: BottomNavigationBarType.fixed,

          unselectedItemColor: Colors.black,

          selectedItemColor: Colors.deepOrange,

          backgroundColor: const Color(0xFFECECEC),

          currentIndex: _currentIndex,

          onTap: (index) => setState(() => _currentIndex = index),

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),

              label: 'Tasks',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),

              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),

              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
