import 'package:flutter/material.dart';
import 'package:todo_app/utilities/utils.dart';
import 'package:todo_app/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Tasks',
        theme: ThemeData(
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Color.fromRGBO(240, 251, 255, 1),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.red.shade100),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: customBlue,
                    fontSize: 21,
                    fontWeight: FontWeight.w600),
                actionsIconTheme: IconThemeData(color: customBlue)),
            shadowColor: Colors.white30),
        darkTheme: ThemeData.dark().copyWith(
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.grey,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w600),
                actionsIconTheme: IconThemeData(color: Colors.white)),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.grey),
            shadowColor: Colors.black38),
        themeMode: ThemeMode.system,
        home: HomeView());
  }
}
