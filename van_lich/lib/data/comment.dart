import 'package:van_lich/models/comment.dart';
// String id;
// String userID;
// String contentID;
// String? text;
// String? parentCommentIds;
// DateTime createDate;
// int nOfLikes = 0;
// int nOfChildComments = 0;

final List<Comment> currentComment = [
  Comment(
      id: '001',
      userID: '001',
      contentID: '011',
      text: 'Nice!',
      createDate: DateTime(2023, 5, 26),
      nOfLikes: 1,
  ),
  Comment(
    id: '003',
    userID: '003',
    contentID: '011',
    text: 'Hay ghê.',
    createDate: DateTime(2023, 5, 26),
    nOfLikes: 1,
  ),
  Comment(
    id: '002',
    userID: '002',
    contentID: '011',
    text: 'Cho mình 1 lẩu gà lá é nha.',
    createDate: DateTime(2023, 5, 26),
    nOfLikes: 1,
  ),
];

