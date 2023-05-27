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
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                //Kham pha and search icon
                children: [
                  const Text(
                    'Khám Phá',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Expanded(child: Container()),
                  const Icon(Icons.search,
                    size: 30,

                  ),
                ],

              ),
              //Separation
              const SizedBox(height: 20,),

              //Image slide
              CarouselWithDotsPage(user: currentUsers, content: currentContent),

              const SizedBox(height: 5,),

              //Trending
              const Row(
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
              const SizedBox(height: 2),
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
                    child: const Center(
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
                  const SizedBox(width: 8,),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.black12,
                    ),
                    child: const Center(
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
              const SizedBox(height: 15,),

              //Trending
              scrollingItems(content: currentContent),

              const SizedBox(height: 20,),

              //Bo suu tap
              const Row(
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
              const SizedBox(height: 2),

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
                    child: const Center(
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
                  const SizedBox(width: 8,),
                  Container(
                    width: 60.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.black12,
                    ),
                    child: const Center(
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

              const SizedBox(height: 15,),

              //Bo suu tap
              scrollingCollection(collection: listOfCollection)



            ],
          ),
        ),
        //App bar text


      ),


    );
  }
}
