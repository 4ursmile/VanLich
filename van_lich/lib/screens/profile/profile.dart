import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),
            Container(
            width: double.infinity,

            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('https://cdn.tgdd.vn/Files/2022/03/25/1422359/kham-pha-dau-an-lich-su-co-do-dai-noi-hue-hoang-thanh-hue-202203251516507682.jpg'),

                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.black.withOpacity(0.4),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage('https://syphu.com.vn/wp-content/uploads/2022/11/ga-hoa-de-281364.jpg'),
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
              padding: EdgeInsets.only(left: 8.0, top: 20.0, right: 8.0),
              child: const Column(
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
                  SizedBox(height: 10.0),
                  Text(
                    'Giữa vô vàn món lẩu theo nhiều phong cách ẩm thực khác nhau (Hàn, Thái, Lào, miền Bắc, miền Nam…), lẩu gà vẫn là món được yêu thích và được đề xuất nhiều nhất trong các bàn ăn; bởi vì thịt gà là món ăn không kén khách và quá đỗi quen thuộc trong bữa cơm người Việt. Còn gì tuyệt hơn giữa một ngày se lạnh, mọi người quây quần bên nhau quanh một nồi lẩu nghi ngút khói, hít hà mùi thơm của thịt gà, xì xụp nước lẩu ngọt thanh, tán dóc vài câu chuyện…',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Divider(height: 1.0, color: Colors.grey[400]),
            Container(
              padding: EdgeInsets.only(left: 8.0, top: 20.0, right: 8.0),
              child: const Column(
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
              padding: EdgeInsets.only(left: 8.0, top: 20.0, right: 8.0),
              child: const Column(
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
          ]
          ),

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
