import 'package:get/get_connect.dart';
import 'package:post_case_study/config/constants/api_constants.dart';
import '../models/post_model.dart';

class PostService extends GetConnect {
  /// Tüm gönderileri API'den çeker.
  Future<List<PostModel>?> fetchPosts() async {
    final response =
        await GetConnect().get(ApiConstants.BASE_URL + ApiConstants.POSTS);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return (response.body as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
    }
  }

  /// Belirli bir gönderinin detaylarını API'den çeker.
  Future<PostModel?> fetchPostDetail(int id) async {
    final response = await GetConnect()
        .get('${ApiConstants.BASE_URL}${ApiConstants.POSTS}/$id');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return PostModel.fromJson(response.body);
    }
  }
}
