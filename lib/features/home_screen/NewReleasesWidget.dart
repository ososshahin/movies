import 'package:flutter/material.dart';
import 'package:movies_app/core/theming/colors.dart';
import 'package:movies_app/core/theming/text_style.dart';

import '../../api/apimanager.dart';
import '../../common/MovieWidget.dart';

class Newreleaseswidget extends StatelessWidget {
  const Newreleaseswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 190,
      padding: EdgeInsets.all(12),
      color: AppColors.blackWithOpacity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('New Releases',style: TextStyleApp.font14weight400colorWhite,),
          SizedBox( height: 10,),
          Expanded(
            child: FutureBuilder(future: ApiManager().getNewReleases() , builder: (context, snapshot) {

              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10,),
                itemCount: snapshot.data?.movie!.length??0,
                scrollDirection:Axis.horizontal,
                itemBuilder:
                    (context, index) => MovieWidget(
                  movie: snapshot.data?.movie![index],
                  imageHeight: 210,
                  bookMarkIconSize: 80,
                  addIconSize: 18,
                  bookMarkIconBottomPadding: 78,
                  bookMarkIconRightPadding: 38,
                  addIconBottomPadding: 100,
                  addIconRightPadding: 52,
                ),);
            },
            ),
          )
        ],
      ),
    );
  }
}
