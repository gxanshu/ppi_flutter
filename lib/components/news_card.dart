import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:share_plus/share_plus.dart';

class NewsCard extends StatelessWidget {
  //final String heading;
  //final String subHeading;
  //final String slug;
  //final String imageUrl;
  const NewsCard({
    super.key,
    //required this.heading,
    //required this.subHeading,
    //required this.slug,
    //required this.imageUrl});\});
  });

  void shareLink() {
    Share.share('check out my website https://example.com');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(10),
                        topEnd: Radius.circular(10)),
                    child: FadeInImage.memoryNetwork(
                      alignment: Alignment.center,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      fadeOutDuration: const Duration(milliseconds: 500),
                      placeholder: kTransparentImage,
                      image:
                          "https://img.freepik.com/free-photo/glowing-lines-human-heart-3d-shape-dark-background-generative-ai_191095-1435.jpg?size=626&ext=jpg&ga=GA1.1.1880011253.1700092800&semt=ais",
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text(
                "भारत लगातार 10 और ऑस्ट्रेलिया लगातार 8 मैच जीत चुका, 20 साल बाद फाइनल में आमने-सामने",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text(
                "वनडे वर्ल्ड कप 2023 का सबसे बड़ा मुकाबला यानी फाइनल आज मेजबान भारत और पांच बार की विश्व विजेता ऑस्ट्रेलिया के बीच खेला जाएगा। ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () {},
                    child: const Text("Read more"),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      IconButton(
                        onPressed: shareLink,
                        icon: const Icon(Icons.share),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
