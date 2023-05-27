import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:card_swiper/card_swiper.dart';

class TikTokVideoPlayerScreen extends StatefulWidget {
  final List<String> videoFilePaths;
  final List<String> videoTitles;
  final List<String> videoDescriptions;

  TikTokVideoPlayerScreen({
    required this.videoFilePaths,
    required this.videoTitles,
    required this.videoDescriptions,
  });

  @override
  _TikTokVideoPlayerScreenState createState() =>
      _TikTokVideoPlayerScreenState();
}

class _TikTokVideoPlayerScreenState extends State<TikTokVideoPlayerScreen>
    with TickerProviderStateMixin {
  late SwiperController _swiperController;
  late VideoPlayerController _videoPlayerController;
  bool _isVideoPlaying = false;
  bool heartButtonPressed = false;
  bool starButtonPressed = false;
  bool shareButtonPressed = false;
  bool commentButtonPressed = false;

  AnimationController? _heartAnimationController;
  Animation<double>? _heartAnimation;

  AnimationController? _likeAnimationController;
  Animation<double>? _likeAnimation;

  AnimationController? _shareAnimationController;
  Animation<double>? _shareAnimation;

  AnimationController? _commentAnimationController;
  Animation<double>? _commentAnimation;

  int _currentVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();

    _initializeVideoPlayer(_currentVideoIndex);

    _heartAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _likeAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _shareAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _commentAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _heartAnimationController?.dispose();
    _likeAnimationController?.dispose();
    _shareAnimationController?.dispose();
    _commentAnimationController?.dispose();
    _swiperController.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer(int videoIndex) {
    _videoPlayerController = VideoPlayerController.asset(
      widget.videoFilePaths[videoIndex],
    )
      ..initialize().then((_) {
        setState(() {
          _isVideoPlaying = true;
          _videoPlayerController.play();
        });
      });
  }

  void _animateHeartButton() {
    _heartAnimationController?.reset();
    _heartAnimationController?.forward().then((_) {
      _heartAnimationController?.reverse();
    });
  }

  void _animateStarButton() {
    _likeAnimationController?.reset();
    _likeAnimationController?.forward().then((_) {
      _likeAnimationController?.reverse();
    });
  }

  void _animateShareButton() {
    _shareAnimationController?.reset();
    _shareAnimationController?.forward().then((_) {
      _shareAnimationController?.reverse();
    });
  }

  void _animateCommentButton() {
    _commentAnimationController?.reset();
    _commentAnimationController?.forward().then((_) {
      _commentAnimationController?.reverse();
    });
  }

  void _playNextVideo() {
    setState(() {
      _currentVideoIndex++;
      if (_currentVideoIndex >= widget.videoFilePaths.length) {
        // Reached the end, loop back to the first video
        _currentVideoIndex = 0;
      }
      _initializeVideoPlayer(_currentVideoIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        child: Stack(
          children: [
            Swiper(
              scrollDirection: Axis.vertical,
              axisDirection: AxisDirection.right,
              itemCount: widget.videoFilePaths.length,
              index: _currentVideoIndex,
              onIndexChanged: (index) {
                setState(() {
                  _videoPlayerController.pause();
                  _currentVideoIndex = index;
                  // _initializeVideoPlayer(_currentVideoIndex);
                });
              },
              controller: _swiperController,
              loop: false,
              itemBuilder: (context, index) {
                return Center(
                  child: AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    // child: VideoPlayer(_videoPlayerController),
                    child: VideoPlayer(_currentVideoIndex == index ? _videoPlayerController : VideoPlayerController.asset('')),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _animateHeartButton();
                        if (!heartButtonPressed)
                          heartButtonPressed = true;
                        else
                          heartButtonPressed = false;
                      });
                    },
                    icon: ScaleTransition(
                      scale: _heartAnimation ??=
                          Tween<double>(begin: 1.0, end: 1.5).animate(
                            CurvedAnimation(
                              parent: _heartAnimationController!,
                              curve: Curves.easeInOut,
                            ),
                          ),
                      child: Icon(
                        Icons.favorite,
                        color:
                        heartButtonPressed ? Colors.pink : Colors.white,
                        size: 32.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _animateStarButton();
                        if (!starButtonPressed)
                          starButtonPressed = true;
                        else
                          starButtonPressed = false;
                      });
                    },
                    icon: ScaleTransition(
                      scale: _likeAnimation ??=
                          Tween<double>(begin: 1.0, end: 1.5).animate(
                            CurvedAnimation(
                              parent: _likeAnimationController!,
                              curve: Curves.easeInOut,
                            ),
                          ),
                      child: Icon(
                        Icons.star,
                        color:
                        starButtonPressed ? Colors.yellow : Colors.white,
                        size: 32.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _animateShareButton();
                        if (!shareButtonPressed)
                          shareButtonPressed = true;
                        else
                          shareButtonPressed = false;
                      });
                    },
                    icon: ScaleTransition(
                      scale: _shareAnimation ??=
                          Tween<double>(begin: 1.0, end: 1.5).animate(
                            CurvedAnimation(
                              parent: _shareAnimationController!,
                              curve: Curves.easeInOut,
                            ),
                          ),
                      child: Icon(
                        Icons.share,
                        color:
                        shareButtonPressed ? Colors.blue : Colors.white,
                        size: 32.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _animateCommentButton();
                        if (!commentButtonPressed)
                          commentButtonPressed = true;
                        else
                          commentButtonPressed = false;
                      });
                    },
                    icon: ScaleTransition(
                      scale: _commentAnimation ??=
                          Tween<double>(begin: 1.0, end: 1.5).animate(
                            CurvedAnimation(
                              parent: _commentAnimationController!,
                              curve: Curves.easeInOut,
                            ),
                          ),
                      child: Icon(
                        Icons.comment,
                        color:
                        commentButtonPressed ? Colors.green : Colors.white,
                        size: 32.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.videoTitles[_currentVideoIndex],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      widget.videoDescriptions[_currentVideoIndex],
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}
