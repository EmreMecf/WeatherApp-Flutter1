import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue, Colors.limeAccent]),
      ),
      child: Center(
        child: SpinKitWaveSpinner(
          color: Colors.white,
          size: 150.0,
          duration: Duration(milliseconds: 2500),
        ),
      ),
    );
  }
}
