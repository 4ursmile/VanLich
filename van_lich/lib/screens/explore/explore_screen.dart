import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:swipe_deck/swipe_deck.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:van_lich/data/collection.dart';
import 'package:van_lich/data/content.dart';
import 'package:van_lich/data/user.dart';
import 'package:van_lich/models/models.dart';
import 'package:van_lich/screens/explore/widgets/imageCarousel.dart';
import 'package:van_lich/screens/explore/widgets/scrollingCollection.dart';
import 'package:van_lich/screens/explore/widgets/scrollingItems.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                //Kham pha and search icon
                children: [
                  Text('Khám Phá',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(Icons.search,
                    size: 30,

                  ),
                ],

              ),
              //Separation
              SizedBox(height: 20,),

              //Image slide
              CarouselWithDotsPage(user: currentUsers, content: currentContent),

              SizedBox(height: 5,),

              //Trending
              Row(
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),

                  ),
                  Icon(Icons.arrow_forward_ios,
                    size: 22.0,
                  )
                ],

              ),
              SizedBox(height: 2),
              //Sort by trending
              Row(
                children: [
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.black12,
                    ),
                    child: Center(
                      child: Text(
                        'Hôm nay',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black87,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.black12,
                    ),
                    child: Center(
                      child: Text(
                        'Tuần này',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black87,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),

              //Trending
              scrollingItems(user: currentUsers, content: currentContent),

              SizedBox(height: 20,),

              //Bo suu tap
              Row(
                children: [
                  Text(
                    'Bộ sưu tập',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),

                  ),
                  Icon(Icons.arrow_forward_ios,
                    size: 22.0,
                  )

                ],

              ),

              //Spacing
              SizedBox(height: 2),

              //Sort by bo su tap
              Row(
                children: [
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.black12,
                    ),
                    child: Center(
                      child: Text(
                        'Mới nhất',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black87,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.black12,
                    ),
                    child: Center(
                      child: Text(
                        'Liên quan',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black87,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15,),

              //Bo suu tap
              scrollingCollection(user: currentUsers, collection: listOfCollection)



            ],
          ),
        ),
        //App bar text


      ),


    );
  }
}


// //Image link
// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
// ];
//
// //Image carousel
// class CarouselWithDotsPage extends StatefulWidget {
//
//   @override
//   ImageCarousel createState() => ImageCarousel();
// }
//
// class ImageCarousel extends State<CarouselWithDotsPage> {
//   int _current = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> imageSliders = imgList
//         .map((item) => GestureDetector(
//           onTap: () {
//             //Show image swipe on home screen
//             // Handle image click event here
//             print('Image clicked: $item');
//           },
//           child: Container(
//           child: ClipRRect(
//             borderRadius: BorderRadius.all(
//               Radius.circular(5.0),
//             ),
//             child: Stack(
//               children: [
//                 Image.network(
//                   item,
//                   fit: BoxFit.cover,
//                   width: 1000,
//                 ),
//                 Positioned(
//                   bottom: 0.0,
//                   left: 0.0,
//                   right: 0.0,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Color.fromARGB(200, 0, 0, 0),
//                           Color.fromARGB(0, 0, 0, 0),
//                         ],
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter,
//                       ),
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 10,
//                     ),
//                     child: Text(
//                       //Get text from object
//                       'Header Text Here',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20.0,
//                         overflow: TextOverflow.fade,
//                         ),
//                         maxLines: 2,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ))
//         .toList();
//
//     return Column(
//       children: [
//         CarouselSlider(
//           items: imageSliders,
//           options: CarouselOptions(
//               height: 180,
//               autoPlay: true,
//               autoPlayInterval: Duration(seconds: 4),
//               enlargeCenterPage: true,
//               aspectRatio: 2.0,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _current = index;
//                 });
//               }),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: imgList.map((url) {
//             int index = imgList.indexOf(url);
//             return Container(
//               width: 5,
//               height: 5,
//               margin: EdgeInsets.symmetric(
//                 vertical: 10,
//                 horizontal: 3,
//               ),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: _current == index
//                     ? Color.fromRGBO(0, 0, 0, 0.9)
//                     : Color.fromRGBO(0, 0, 0, 0.4),
//               ),
//             );
//           }).toList(),
//         )
//       ],
//     );
//   }
// }
