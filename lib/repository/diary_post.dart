import 'package:trade_diary/dataSource/diary_post.dart';
import 'package:trade_diary/model/diary_post.dart';

class DiaryPostRepo {
  final datasource = DiaryPostDataSource();

  Future<List> getDiaryPost(String postId) async {
    return datasource.getDiaryPost(postId);
  }

  Future<void> addDiaryPost(DiaryPostModel data) async {
    return datasource.createDiaryPost(data);
  }

  Future<List> isUserWriteDiaryToday(String userId) {
    return datasource.isWriteDiaryToday(userId);
  }

  Future getFriendDiaryPost(String userId) async {
    return datasource.getFriendDiaryPost(userId);
  }
}
