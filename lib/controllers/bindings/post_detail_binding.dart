import 'package:get/get.dart';
import '../../services/post_service.dart';
import '../post_detail_controller.dart';

class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    /// Get.lazyPut() ile PostService sınıfı her çağrıldığında yeni bir örnek oluşturulur.
    Get.lazyPut<PostService>(() => PostService());
    /// PostDetailController sınıfı çağrıldığında PostService sınıfı da çağrılır.
    Get.lazyPut<PostDetailController>(
        () => PostDetailController(postService: Get.find<PostService>()));
  }
}
