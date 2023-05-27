import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:van_lich/data/content.dart';
import 'package:van_lich/models/models.dart';
import 'package:van_lich/screens/content_detail/content_detail_screen.dart';

class scrollingItems extends StatelessWidget {
  final List<Content> content;

  const scrollingItems({
    Key? key,
    required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 8.0,
          ),
          scrollDirection: Axis.horizontal,

          //Co the null
          itemCount: content.length,


          itemBuilder: (BuildContext context, int index) {
            // final User? indexUser = user?[index];
            final Content indexContent = content[index];
            //Tim nguoi dang bai do
            // User postUser = User(id: '000', email: '00@gmail.com', password: '123456');
            // for (var u in user!) {
            //   if (u.id == indexContent.userID) {
            //     postUser = u;
            //     break;
            //   }
            // }
            //Truyen vao nguoi dang va content bai do
            return scrollItem(
              content: indexContent,
            );
          }
      ),
    );
  }

}


class scrollItem extends StatelessWidget {
  final Content content;
  const scrollItem ({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {
          if (content != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  ContentDetailScreen(content: content)),
            );
            print('Trending widget tapped ${content.id}');
          }

        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // Specify the desired border radius here
          child: Container(
            height: 150,
            width: 110,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image(
                  image: AssetImage(content!.mainGraphicUrl),
                  fit: BoxFit.cover,
                ),
                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black12.withOpacity(0.2),
                      ],
                    ),
                  ),
                ),
                // Noi dung trong trending card
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8, top: 10, right: 5),
                        child: Text(
                          content!.caption,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            height: 1,
                            overflow: TextOverflow.fade,
                          ),
                          maxLines: 4,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}

