import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprojects/locator.dart';
import 'package:testprojects/screens/main_screen.dart';

import 'providers/location_provider.dart';

void main() {
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Projects',
      theme: ThemeData.dark(),
      home: ChangeNotifierProvider(
          create: (context) =>
              locator<LocationProvider>()..getCurrentLocation(),
          child: const MainScreen()),
    );
    Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
      ),
    );
  }
}
