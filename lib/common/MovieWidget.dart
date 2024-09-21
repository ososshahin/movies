import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/api/model/Movie.dart';

import 'ImportantUrl.dart';

class MovieWidget extends StatelessWidget {
  Movie? movie;
  int? imageHeight;
  double? bookMarkIconSize;
  double? addIconSize;
  double? bookMarkIconBottomPadding;
  double? addIconBottomPadding;
  double? bookMarkIconRightPadding;
  double? addIconRightPadding;


  MovieWidget({this.movie,
    this.imageHeight,
    this.bookMarkIconSize,this.addIconSize,
  this.bookMarkIconBottomPadding,this.bookMarkIconRightPadding,
  this.addIconBottomPadding,this.addIconRightPadding});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Stack(
      children: [
       CachedNetworkImage(imageUrl:ImportantUrl().BaseImageUrl+movie!.posterPath!,
       height: imageHeight?.h,) ,
        Positioned(
          bottom:bookMarkIconBottomPadding?.h ,
          right: bookMarkIconRightPadding?.w ,
          child: Opacity(
            opacity: 1,
            child: ImageIcon(
                size: bookMarkIconSize,
                color: Color(0xff514F4F),
                AssetImage(
                  'assets/images/Icon awesome-bookmark.png',
                )),
          ),
        ),
        Positioned(
          bottom: addIconBottomPadding?.h,
          right: addIconRightPadding?.w,
          child: IconButton(onPressed: () {

          }, icon: Icon( Icons.add,size: addIconSize,),
            color: Colors.white,),
        )
      ],
    );
  }

}