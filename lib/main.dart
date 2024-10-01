import 'package:flutter/material.dart';
import 'package:news_app/view/bottom_nav_page.dart';
import 'package:news_app/view/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=>ThemeProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<ThemeProvider>().getPrefValue();
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: context.watch<ThemeProvider>().getThemeValue()?ThemeMode.dark:ThemeMode.light,


      home: BottomNavPage(),
    );
  }
}

