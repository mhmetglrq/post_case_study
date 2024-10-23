import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/post_service.dart';

class PostDetailController extends GetxController {
  final PostService postService;

  PostDetailController({required this.postService});

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

  Future<void> fetchPostDetail(int postId) async {
    try {
      isLoading(true);
      postDetail = await postService.fetchPostDetail(postId);
    } finally {
      isLoading(false);
    }
  }
}
