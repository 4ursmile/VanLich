import 'package:van_lich/models/collection.dart';
import 'package:van_lich/models/content.dart';

// String id = '';
// String name = '';
// String userId = '';
// String description = '';
// String thumbnail = '';
// List<String> contentIds = [];
final List<Collection> listOfCollection = [
  Collection(
    id: '001',
    name: 'Coll1',
    userId: '001',
    description: 'Huyền sử Việt Nam',
    thumbnail: 'assets/images/tqt.jpeg',
    contentIds: ['001', '011'],
  ),
  Collection(
    id: '002',
    name: 'Coll2',
    userId: '002',
    description: 'Văn hoá',
    thumbnail: 'assets/images/chung.jpeg',
    contentIds: ['002', '022'],
  ),

  Collection(
    id: '002',
    name: 'Coll2',
    userId: '002',
    description: 'Danh lam thắng cảnh',
    thumbnail: 'assets/images/danh.jpeg',
    contentIds: ['002', '022'],
  ),
];
