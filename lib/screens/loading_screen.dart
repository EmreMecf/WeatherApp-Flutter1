import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assest/arka.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: SpinKitWaveSpinner(
          color: Colors.white,
          size: 75,
          duration: Duration(milliseconds: 2500),
        ),
      ),
    );
  }
}
