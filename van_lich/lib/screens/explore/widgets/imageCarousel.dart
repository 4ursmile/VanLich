
//Image carousel
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:van_lich/data/content.dart';
import 'package:van_lich/models/models.dart';

import '../../content_detail/content_detail_screen.dart';


class CarouselWithDotsPage extends StatefulWidget {
  final List<User> user;
  final List<Content> content;

  const CarouselWithDotsPage({
    Key? key,
    required this.user,
    required this.content
  }) : super(key: key);

  @override
  ImageCarousel createState() => ImageCarousel();
}

class ImageCarousel extends State<CarouselWithDotsPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.content!
        .map((content) => GestureDetector(
      onTap: () {
        //Show image swipe on home screen
        // Handle image click event here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              ContentDetailScreen(content: content)),
        );
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: Stack(
            children: [

              //Neu dung api thi dung image network, con dang test thi dung
              //image.asset
              Image.asset(
                content.mainGraphicUrl,
                fit: BoxFit.cover,
                width: 1000,
              ),

              // Image.network(
              //   //image link
              //   content.mainGraphicUrl,
              //   fit: BoxFit.cover,
              //   width: 1000,
              // ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    //Get text from object
                    content.caption,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      overflow: TextOverflow.fade,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ))
        .toList();

    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              height: 180,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: currentContent.map((url) {
            int index = currentContent.indexOf(url);
            return Container(
              width: 5,
              height: 5,
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 3,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
