import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:van_lich/data/content.dart';
import 'package:van_lich/models/models.dart';

class scrollingItems extends StatelessWidget {
  final List<User>? user;
  final List<Content>? content;

  const scrollingItems({
    Key? key,
    @required this.user,
    @required this.content
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
          itemCount: content!.length,


          itemBuilder: (BuildContext context, int index) {
            // final User? indexUser = user?[index];
            final Content? indexContent = content?[index];
            User? postUser;
            for (var u in user!) {
              if (u.id == indexContent!.userID) {
                postUser = u;
                break;
              }
            }
            return scrollItem(
              user: postUser,
              content: indexContent,
            );
          }
      ),
    );
  }

}


class scrollItem extends StatelessWidget {
  final User? user;
  final Content? content;
  const scrollItem ({
    Key? key,
    this.user,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {
          // Handle tap event on the trending widget
          print('Trending widget tapped');
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

