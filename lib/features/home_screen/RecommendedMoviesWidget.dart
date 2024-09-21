import 'package:flutter/material.dart';

import '../../api/apimanager.dart';
import '../../common/DetailsMovieWidget.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/text_style.dart';

class Recommendedmovieswidget extends StatelessWidget {
  const Recommendedmovieswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(12),
      height: 270,
      color: AppColors.blackWithOpacity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Recommended' ,style: TextStyleApp.font14weight400colorWhite,),
          SizedBox( height: 15,),
          FutureBuilder(future:ApiManager().getRecommended() ,
            builder:(context, snapshot) {
              return Expanded(
                child: ListView.separated(itemBuilder:
                    (context, index) => Detailsmoviewidget(
                  movie: snapshot.data?.movies![index],
                )
                  , separatorBuilder:  (context, index) => SizedBox( width: 6,)
                  , itemCount: snapshot.data?.movies?.length??0,
                  scrollDirection: Axis.horizontal,

                ),
              );
            },
          )
        ],
      ),
    );
  }
}
