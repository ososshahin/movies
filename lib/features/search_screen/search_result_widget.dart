//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../api/model/Movie.dart';
// import '../../common/ImportantUrl.dart';
// import '../../common/MovieWidget.dart';
// import '../../core/theming/text_style.dart';
//
// class searchResultWidget extends StatelessWidget
// {
//   final Movie? movie;
//
//   const searchResultWidget({super.key, this.movie});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 10.h),
//       child: Row(
//         children: [
//           Container( width: 60.w,height: 90.h,
//             child: CachedNetworkImage(
//               imageUrl:ImportantUrl().BaseImageUrl+(movie?.posterPath??''),
//               height: MovieWidget().imageHeight?.h,
//               placeholder: (context, url) =>
//               const Center(child: CircularProgressIndicator()),
//               errorWidget: (context, url, error) =>
//               const Icon(Icons.error, color: Colors.red),
//             ),
//           )
//
//           ,SizedBox(width: 10.w)
//           ,Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(movie?.title??'no title founded',
//                   style: TextStyleApp.font14weight400colorWhite,),
//                 SizedBox(width: 10.w),
//                 Text( movie?.releaseDate??'no date founded',
//                   style: TextStyleApp.font14weight400colorWhite.copyWith(color:Colors.white.withOpacity(.67)),),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
// }