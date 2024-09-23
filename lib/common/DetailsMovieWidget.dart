import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/DateUtils.dart';
import 'package:movies_app/api/model/Movie.dart';
import 'package:movies_app/common/MovieWidget.dart';
import 'package:movies_app/core/theming/colors.dart';
import 'package:movies_app/core/theming/text_style.dart';

class DetailsMovieWidget extends StatelessWidget {
   DetailsMovieWidget({super.key, this.movie});
  Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const BeveledRectangleBorder(
        side: BorderSide(
        color: Colors.transparent
        )
      ),
      elevation:4 ,
      surfaceTintColor: AppColors.blackWithOpacity,
      color: AppColors.blackWithOpacity,
      child: Container(
        height: 185,
        width: 88,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieWidget(
              movie: movie,
              imageHeight: 120,
              bookMarkIconBottomPadding: 90,
               bookMarkIconSize: 40,
              bookMarkIconRightPadding: 50,
              addIconBottomPadding:85,
              addIconRightPadding: 45,
              addIconSize: 18,

            ),
            SizedBox( height: 10.h,),
            Row(
              children: [
                Icon(Icons.star, color: AppColors.yellow1, size: 12,),
                Text(
                  movie!.voteAveragetoNearestDecimal()??''
                  ,style: TextStyleApp.font10weight400colorWhite,
                ),
              ],
            ),
            const SizedBox(height: 8,),
            Text(movie?.title??'', style: TextStyleApp.font10weight400colorWhite,),
            const SizedBox(height: 8,),
            Text('${movie?.releaseDate?.formatDate()}  ${movie!.adult??false?'R':'G'}',
            textAlign: TextAlign.start,
            style:TextStyleApp.font8weight400colorWhite,)

  ])));}
}
