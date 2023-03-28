import 'package:flutter/material.dart';
import 'package:tif_assignment/features/home/view/home_screen.dart';
import 'package:tif_assignment/ui/app_theme.dart';

import 'features/home/view/event_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIF',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routes: {
        '/': (context) => const HomeScreen(title: 'Events',),
        '/details': (context) => const EventDetails(),
      },
    );
  }
}

