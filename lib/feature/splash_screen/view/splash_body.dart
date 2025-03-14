import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Shimmer.fromColors(
          baseColor: Colors.purple,
          highlightColor: Colors.blue,
          child: Text("Welcome to the app",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30 ),),
        ),
      ),
    );
  }
}
