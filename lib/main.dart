import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3 Screen Nav App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1;

  final List<Widget> _screens = [TasksScreen(), HomeScreen(), ProfileScreen()];

  final List<String> _titles = ["Tasks", "Home", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_currentIndex]), centerTitle: true),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFC0C0C0), width: 1.0)),
        ),
        child: BottomNavigationBar(
          iconSize: 32,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.deepOrange,
          backgroundColor: Color(0xFFECECEC),
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
