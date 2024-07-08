import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/homeScreen/home_screen.dart';
import 'package:to_do_app/screens/homeScreen/provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeScreenProvider(),
          )],
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',

      home: HomeScreen(),
    ));
  }
}