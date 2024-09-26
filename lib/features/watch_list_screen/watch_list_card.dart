import 'package:flutter/material.dart';
class WatchListCard extends StatelessWidget {
  final String title;
  final String year;
  final String actors;
  final String imagePath;
  
  const WatchListCard({required this.title,
  required this.year,
  required this.actors,
  required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: ListTile(
        leading: Image.asset(imagePath,width: 50,fit: BoxFit.cover,),
        title: Text(title),
        subtitle: Text('$year\n$actors'),
        isThreeLine: true,
        trailing: Icon(Icons.check_circle,color: Colors.amber,),
      ),
    );
  }
}
