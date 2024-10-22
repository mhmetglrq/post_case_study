import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/post_service.dart';

class PostDetailController extends GetxController {
  var isLoading = true.obs;
  PostModel? postDetail;

  @override
  void onInit() {
    super.onInit();
    var postId = Get.arguments;
    if (postId != null) {
      fetchPostDetail(postId);
    }
  }

  void fetchPostDetail(int postId) async {
    try {
      isLoading(true);
      postDetail = await PostService.fetchPostDetail(postId);
    } finally {
      isLoading(false);
    }
  }
}
