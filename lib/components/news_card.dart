import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  //final String heading;
  //final String subHeading;
  //final String slug;
  //final String imageUrl;
  const NewsCard(
      {super.key,
      //required this.heading,
      //required this.subHeading,
      //required this.slug,
      //required this.imageUrl});\});
});


  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Card(
        child: SizedBox(
          height: 400,
          child: Center(child: Text('Elevated Card')),
        ),
      ),
    );
  }
}
