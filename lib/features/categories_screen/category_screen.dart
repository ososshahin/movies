import 'package:flutter/material.dart';
import 'package:movies_app/api/model/MoviesListResponse.dart';
import 'package:movies_app/features/categories_screen/movies_screen.dart';

class CategoryScreen extends StatefulWidget
{
  static const String routeName = 'category_screen';
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<dynamic> genres = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    MoviesListResponse();
  }
  void navigateToMovies(String genreId){

  Navigator.push(context,
  MaterialPageRoute(builder: (context) => MoviesScreen(genreId:genreId),),);
}

@override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Browse Category",
        style: TextStyle(fontSize: 22,color: Colors.white,
        fontWeight: FontWeight.bold),),
            Expanded(
              child:isLoading?Center(child: CircularProgressIndicator(),)
                    :GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,),
                  itemCount: genres.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        navigateToMovies(genres[index]['id']);
                      },

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          ),
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/cinema.jpg",
                          fit: BoxFit.cover,),

                      ),
                      ),
                    );
                      },
                      ),





                  ),
  ],
            ),
  );

  }
}