// import 'package:flutter/material.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:van_lich/components/behavior_button.dart';
//
// import '../../models/content.dart';
//
// class ContentDetailScreen extends StatefulWidget {
//   ContentDetailScreen({Key? key, required this.content}) : super(key: key);
//   Content content;
//
//   @override
//   State<ContentDetailScreen> createState() => _ContentDetailScreenState();
// }
//
// class _ContentDetailScreenState extends State<ContentDetailScreen> {
//   String dummyText = '''
//   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
//   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
//   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
//   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
//   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
//   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
//   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
//   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
//   ''';
//   PanelController _panelController = PanelController();
//   double _minHeightRatio = 0;
//   @override
//   void initState() {
//     Future.delayed(const Duration(milliseconds: 400), () {
//       _panelController.open();
//       _minHeightRatio = 0.3;
//       setState(() {
//
//       });
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Hero(
//           tag: widget.content.id,
//           child: Material(
//             type: MaterialType.transparency,
//             child: SlidingUpPanel(
//               body: Image(
//                 image: AssetImage(widget.content.mainGraphicUrl),
//                 fit: BoxFit.cover,
//               ),
//               controller: _panelController,
//               defaultPanelState: PanelState.CLOSED,
//               header: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
//                 child: Container(
//                   width: 60,
//                   height: 5,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     color: Colors.black.withOpacity(0.3),
//                   ),
//                 ),
//               ),
//               minHeight: size.height * _minHeightRatio,
//               maxHeight: size.height * 0.8,
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//               panelBuilder: (controller) {
//                 return Padding(
//                     padding: const EdgeInsets.only(left: 15, bottom: 20),
//                     child: ListView(
//                       controller: controller,
//                       children: [
//                         Column(
//                           children: [
//                              Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   widget.content.name,
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(
//                                   height: 2,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'by Editor',
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text(
//                                       'following',
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             Text(widget.content.description ?? ''),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 BehaviorButton(
//                                     icon: Icons.star,
//                                     color: Colors.yellow,
//                                     text: '${widget.content.nOfStars}K',
//                                     onTap: () {}),
//                                 BehaviorButton(
//                                     icon: Icons.favorite,
//                                     color: Colors.red,
//                                     text: '${widget.content.nOfFavs}K',
//                                     onTap: () {
//                                       print('hihi');
//                                     }),
//                                 BehaviorButton(
//                                     icon: Icons.messenger,
//                                     text: '${widget.content.nOfComments}K',
//                                     onTap: () {}),
//                                 BehaviorButton(
//                                     icon: Icons.bookmark,
//                                     text: '12K',
//                                     onTap: () {}),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                           ],
//                         ),
//                          Text(
//                           'Liên quan',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25,
//                             shadows: [
//                               BoxShadow(
//                                 blurRadius: 6.0,
//                                 spreadRadius: 3.0,
//                                 offset: const Offset(2, 3),
//                                 color: Colors.black.withOpacity(0.3)
//                               )
//                             ]
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 15.0),
//                           child: Container(
//                             height: 60,
//                             width: 200,
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Color(0xffDDDDDD),
//                                   blurRadius: 6.0,
//                                   spreadRadius: 2.0,
//                                   offset: Offset(0.0, 0.0),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                         )
//                       ],
//                     ));
//               },
//             ),
//           )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:van_lich/components/behavior_button.dart';

import '../../models/content.dart';

class ContentDetailScreen extends StatefulWidget {
  ContentDetailScreen({Key? key, required this.content}) : super(key: key);
  Content content;

  @override
  State<ContentDetailScreen> createState() => _ContentDetailScreenState();
}

class _ContentDetailScreenState extends State<ContentDetailScreen> {
  String dummyText = '''
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
  ''';
  PanelController _panelController = PanelController();
  double _minHeightRatio = 0;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 400), () {
      _panelController.open();
      _minHeightRatio = 0.3;
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Hero(
          tag: widget.content.id,
          child: Material(
            type: MaterialType.transparency,
            child: SlidingUpPanel(
              body: Image(
                image: AssetImage(widget.content.mainGraphicUrl),
                fit: BoxFit.cover,
              ),
              controller: _panelController,
              defaultPanelState: PanelState.CLOSED,
              header: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
              minHeight: size.height * _minHeightRatio,
              maxHeight: size.height * 0.8,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              panelBuilder: (controller) {
                return Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: ListView(
                      controller: controller,
                      children: [
                        Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.content.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'by Editor',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'following',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, right: 30.0, left: 20.0),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  widget.content.content ?? '',
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                BehaviorButton(
                                    icon: Icons.star,
                                    color: Colors.yellow,
                                    text: '${widget.content.nOfStars}K',
                                    onTap: () {}),
                                BehaviorButton(
                                    icon: Icons.favorite,
                                    color: Colors.red,
                                    text: '${widget.content.nOfFavs}K',
                                    onTap: () {
                                      print('hihi');
                                    }),
                                BehaviorButton(
                                    icon: Icons.messenger,
                                    text: '${widget.content.nOfComments}K',
                                    onTap: () {}),
                                BehaviorButton(
                                    icon: Icons.bookmark,
                                    text: '12K',
                                    onTap: () {}),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Text(
                          'Liên quan',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              shadows: [
                                BoxShadow(
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0,
                                    offset: const Offset(2, 3),
                                    color: Colors.black.withOpacity(0.3)
                                )
                              ]
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            height: 60,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xffDDDDDD),
                                  blurRadius: 6.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        )
                      ],
                    ));
              },
            ),
          )),
    );
  }
}
