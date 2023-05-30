import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:van_lich/api/index.dart';
import 'package:van_lich/components/behavior_button.dart';

import '../../models/content.dart';

class ContentDetailScreen extends StatefulWidget {
  ContentDetailScreen({Key? key, required this.content}) : super(key: key);
  Content content;

  @override
  State<ContentDetailScreen> createState() => _ContentDetailScreenState();
}

class _ContentDetailScreenState extends State<ContentDetailScreen>
    with SingleTickerProviderStateMixin {
  String dummyText = '''
  Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
  ''';
  PanelController _panelController = PanelController();
  double _minHeightRatio = 0;
  bool isStarred = false;
  bool isFavorited = false;
  late AnimationController _animationController;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _buttonAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    Future.delayed(const Duration(milliseconds: 400), () {
      _panelController.open();
      _minHeightRatio = 0.3;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onButtonTap() {
    if (_animationController.isAnimating) return;
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
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
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            panelBuilder: (controller) {
              return ListView(
                controller: controller,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.content.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Text(
                                  'by Editor',
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'following',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          right: 30.0,
                          left: 20.0,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            widget.content.content ?? '',
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BehaviorButton(
                            icon: Icons.star,
                            color: (isStarred) ? Colors.yellow : Colors.grey,
                            text:
                                '${widget.content.nOfStars + (isStarred ? 1 : 0)}',
                            onTap: () {
                              setState(() {
                                isStarred = !isStarred;
                              });
                            },
                            scale: _buttonAnimation.value,
                          ),
                          BehaviorButton(
                            icon: Icons.favorite,
                            color: (isFavorited) ? Colors.red : Colors.grey,
                            text:
                                '${widget.content.nOfFavs + (isFavorited ? 1 : 0)}',
                            onTap: () {
                              setState(() {
                                isFavorited = !isFavorited;
                              });
                            },
                            scale: _buttonAnimation.value,
                          ),
                          BehaviorButton(
                            icon: Icons.messenger,
                            color: Colors.grey,
                            text: '${widget.content.nOfComments}',
                            onTap: () {

                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return SingleChildScrollView(
                                        child: Container(
                                      height: size.height * 0.7,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(30),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 150, vertical: 10),
                                            child: Container(
                                              width: 60,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: size.height * 0.6,
                                            child: ListView(
                                              shrinkWrap: true,
                                              children: const [
                                                CommentTile(),
                                                CommentTile(),
                                                CommentTile(),
                                                CommentTile(),
                                                CommentTile(),
                                                CommentTile(),
                                                CommentTile(),
                                                CommentTile(),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/images/ba-trieu-01.png'),
                                                radius: 15,
                                              ),
                                              Expanded(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Add a comment...',
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16.0,
                                                            vertical: 12.0),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.send),
                                                onPressed: () {
                                                  // Handle comment submission here
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ));
                                  });
                            },
                            scale: _buttonAnimation.value,
                          ),
                          BehaviorButton(
                            icon: Icons.bookmark,
                            color: Colors.grey,
                            text: '',
                            onTap: () {},
                            scale: _buttonAnimation.value,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  RelatedContents(widget: widget),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  const CommentTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/ba-trieu-01.png'),
            radius: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'hhee',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const Text('Hay quá!'),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          BehaviorButton(icon: Icons.favorite, text: '0', onTap: () {}),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

class RelatedContents extends StatelessWidget {
  const RelatedContents({
    super.key,
    required this.widget,
  });

  final ContentDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  color: Colors.black.withOpacity(0.3),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          FutureBuilder(
              future: API.getListOfContents(cate: widget.content.categories),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount:
                          snapshot.data!.length < 2 ? snapshot.data!.length : 2,
                      itemBuilder: (context, index) => Padding(
                            padding:
                                const EdgeInsets.only(right: 15.0, bottom: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ContentDetailScreen(content: snapshot.data![index])));
                              },
                              child: Container(
                                height: 80,
                                width: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          snapshot.data![index].mainGraphicUrl),
                                      fit: BoxFit.cover),
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.9),
                                        Colors.transparent
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 15,
                                        left: 15,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index].caption,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'by Auth',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                BehaviorButton(
                                                    icon: Icons.favorite,
                                                    color: Colors.red,
                                                    text: snapshot
                                                            .data![index].nOfFavs
                                                            .toString(),
                                                    onTap: () {})
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                );
              }),
        ],
      ),
    );
  }
}
