import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Screen',
      theme: ThemeData.light(),
      home: PostScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PostScreenPage extends StatefulWidget {
  @override
  _PostScreenPageState createState() => _PostScreenPageState();
}

class _PostScreenPageState extends State<PostScreenPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  bool _isImageSelected = false;
  bool _isVideoSelected = false;

  void _createPost() {
    // Perform your post creation logic here

    // Show post creation notification
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Post Created'),
          content: Text('Your post has been created successfully.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 600,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80.0),
            Text(
              'Create Post',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                height: 100,
                child: TextField(
                  controller: _titleController,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SizedBox(
                height: 100,
                child: TextField(
                  controller: _contentController,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: 'Content',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        _isImageSelected = !_isImageSelected;
                      });
                    },
                    child: Icon(
                      CupertinoIcons.photo,
                      size: 24.0,
                      color: _isImageSelected ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        _isVideoSelected = !_isVideoSelected;
                      });
                    },
                    child: Icon(
                      CupertinoIcons.video_camera_solid,
                      size: 24.0,
                      color: _isVideoSelected ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createPost,
        child: Icon(Icons.send),
      ),
    );
  }
}
