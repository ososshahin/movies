import 'package:flutter/material.dart';
import 'package:movies_app/features/watch_list_screen/watch_list_card.dart';

class WatchListScreen extends StatelessWidget
{
  static const String routeName = 'watch_list';
  final List<Map<String,String>>movies=
  [
    {'title':'Anita Battle Angel',
      'year':'2024',
      'actors':'Rosa Salazar,Christoph Waltz',
      'image':'assets/images/anami.jpg',

    },
    {'title':'Anita Battle Angel',
      'year':'2024',
      'actors':'Rosa Salazar,Christoph Waltz',
      'image':'assets/images/anami.jpg',

    },
    {'title':'Anita Battle Angel',
      'year':'2024',
      'actors':'Rosa Salazar,Christoph Waltz',
      'image':'assets/images/anami.jpg',

    },
    {'title':'Anita Battle Angel',
      'year':'2024',
      'actors':'Rosa Salazar,Christoph Waltz',
      'image':'assets/images/anami.jpg',

    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('WatchList',style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder:(context, index) {
            return WatchListCard(
                title: movies[index]['title']!,
                year: movies[index]['year']!,
                actors: movies[index]['actors']!,
                imagePath: movies[index]['image']!,);
          }, ),
    );

  }

}