import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/post_service.dart';

class PostDetailController extends GetxController {
  /// Post servis sınıfı. Belirli bir gönderinin detaylarını almak için kullanılır.
  final PostService postService;

  PostDetailController({required this.postService});

  /// Yükleme durumunu tutar.
  var isLoading = true.obs;

  /// Gönderi detayını tutar.
  PostModel? postDetail;

  @override
  void onInit() {
    super.onInit();
    var postId = Get.arguments;
    if (postId != null) {
      fetchPostDetail(postId);
    }
  }

  /// Belirli bir gönderinin detaylarını API'den çeker.
  Future<void> fetchPostDetail(int postId) async {
    try {
      isLoading(true);
      postDetail = await postService.fetchPostDetail(postId);
    } finally {
      isLoading(false);
    }
  }
}
