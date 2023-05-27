import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://example.com/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.black.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'galae',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Followers: 100',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 1.0, color: Colors.grey[400]),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Giới thiệu',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'I love Viet Nam <3',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Divider(height: 1.0, color: Colors.grey[400]),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bài viết gần đây',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  PostTile(
                    title: 'Post 1',
                    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  ),
                  SizedBox(height: 8.0),
                  PostTile(
                    title: 'Post 2',
                    body: 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
                  ),
                ],
              ),
            ),
            Divider(height: 1.0, color: Colors.grey[400]),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bình luận',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  CommentTile(
                    author: 'User1',
                    body: 'Bài viết rất hay và hữu ích',
                  ),
                  SizedBox(height: 8.0),
                  CommentTile(
                    author: 'User2',
                    body: 'Tôi đồng ý với quan điểm của bạn.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostTile extends StatelessWidget {
  final String title;
  final String body;

  const PostTile({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          body,
          style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
        ),
      ],
    );
  }
}

class CommentTile extends StatelessWidget {
  final String author;
  final String body;

  const CommentTile({required this.author, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          author,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          body,
          style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
        ),
      ],
    );
  }
}
