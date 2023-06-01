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
          actions: [
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
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.0),
              Text(
                'Đăng bài viết',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24.0),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: _titleController,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Tiêu đề',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
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
              SizedBox(height: 16.0),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Thể loại',
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black12), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black12), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStatePropertyAll<Color>(Colors.redAccent),
                  ),
                  onPressed: () {},
                  child: Text('Thêm ảnh/video')),
              SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: _createPost,
        child: Icon(Icons.send),
      ),
    );
  }
}
