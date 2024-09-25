import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/api/model/Movie.dart';
import '../features/home_screen/movies_details/moviesDetailsScreen.dart';
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
  final String? title;
  final String? imageUrl;
  final String? year;
  final String? actors;


  MovieWidget({super.key,
    this.movie,
    this.imageHeight,
    this.bookMarkIconSize,
    this.addIconSize,
    this.bookMarkIconBottomPadding,
    this.bookMarkIconRightPadding,
    this.addIconBottomPadding,
    this.addIconRightPadding,
    this.title,
    this.imageUrl,
    this.year,
    this.actors,});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
       InkWell(
         onTap: (){
           Navigator.pushNamed(context, MoviesDetailsScreen.routeName);
         },
         child: CachedNetworkImage(imageUrl:ImportantUrl().BaseImageUrl+movie!.posterPath!,
         height: imageHeight?.h,),
       ) ,
        Positioned(
          bottom:bookMarkIconBottomPadding?.h ,
          right: bookMarkIconRightPadding?.w ,
          child: Opacity(
            opacity: 1,
            child: ImageIcon(
                size: bookMarkIconSize,
                color: const Color(0xff514F4F),
                const AssetImage(
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