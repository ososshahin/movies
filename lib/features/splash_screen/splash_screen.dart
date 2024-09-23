import 'package:flutter/material.dart';
import 'package:movies_app/core/theming/colors.dart';
import '../../home.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
    return Stack(
      children: [
        Container(
          color: AppColors.black,
          child:Scaffold( backgroundColor: AppColors.black,)
        ),
        Center(child: Image.asset('assets/images/movies.png',)),

      ],
    );
  }
}
