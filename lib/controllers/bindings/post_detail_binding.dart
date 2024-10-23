import 'package:get/get.dart';
import '../../services/post_service.dart';
import '../post_detail_controller.dart';

class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostService>(() => PostService());
    Get.lazyPut<PostDetailController>(
        () => PostDetailController(postService: Get.find<PostService>()));
  }
}
