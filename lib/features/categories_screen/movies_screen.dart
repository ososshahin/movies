import 'package:movies_app/api/apimanager.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/model/MoviesDetailsResponse.dart';
import 'package:movies_app/common/ImportantUrl.dart';

class MoviesScreen extends StatelessWidget {
  final String genreId;


   MoviesScreen({ required this.genreId });


  get movie => null;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text("All Movies",
            style: TextStyle(fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,),),
            Expanded(
              child: FutureBuilder<MoviesDetails>(
                future: ApiManager.getMoviesDetails(genreId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final movies = snapshot.data?.results ?? [];
                    return ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                ImportantUrl().BaseImageUrl + movie.posterPath!,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(child: Icon(Icons.error, color: Colors.red));
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No movies found'));
                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
