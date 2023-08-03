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
      theme: ThemeData.light(useMaterial3: true).copyWith(
          colorScheme: const ColorScheme.light(
              primary: Color(0xff5ad9d3), secondary: Color(0xFF7af6ef))),
      home: ChangeNotifierProvider(
          create: (context) =>
              locator<LocationProvider>()..getCurrentLocation(),
          child: const MainScreen()),
    );
  }
}
