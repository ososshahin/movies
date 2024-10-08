import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/categories_screen/movies_screen.dart';
import 'package:movies_app/features/splash_screen/splash_screen.dart';

import 'features/categories_screen/category_screen.dart';
import 'features/home_screen/home_screen.dart';
import 'features/home_screen/movies_details/moviesDetailsScreen.dart';
import 'features/search_screen/search_screen.dart';
import 'features/watch_list_screen/watch_list.dart';
import 'home.dart';


class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Movies App',
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          WatchListScreen.routeName: (context) => WatchListScreen(),
          CategoryScreen.routeName: (context) => CategoryScreen(),
          SearchScreen.routeName: (context) => SearchScreen(),
          Home.routeName: (context) => Home(),
          MoviesDetailsScreen.routeName: (context) => MoviesDetailsScreen(),

        },
      ),
    );
  }
}
