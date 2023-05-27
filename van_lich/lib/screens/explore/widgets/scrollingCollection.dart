
import 'package:flutter/material.dart';
import 'package:van_lich/models/collection.dart';
import '../../../models/user.dart';

class scrollingCollection extends StatelessWidget {
  final List<User>? user;
  final List<Collection>? collection;

  const scrollingCollection({
    Key? key,
    @required this.user,
    @required this.collection
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
          itemCount: collection?.length,

          itemBuilder: (BuildContext context, int index) {
            // final User? indexUser = user?[index];
            final Collection? indexContent = collection?[index];
            User? postUser;
            //Kiem tra collection do ai dang
            for (var u in user!) {
              if (u.id == indexContent!.userId) {
                postUser = u;
                break;
              }
            }
            //Truyen vao collection va nguoi dang
            return scrollItemCollection(
              user: postUser,
              collection: indexContent,
            );
          }
      ),
    );
  }

}


class scrollItemCollection extends StatelessWidget {
  final User? user;
  final Collection? collection;
  const scrollItemCollection ({
    Key? key,
    this.user,
    this.collection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {

          // TODO
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
                  image: AssetImage(collection!.thumbnail),
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
                          collection!.description,
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