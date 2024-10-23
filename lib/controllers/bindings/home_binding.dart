import 'package:get/get.dart';
import '../../services/post_service.dart';
import '../home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    /// Get.lazyPut() ile PostService sınıfı her çağrıldığında yeni bir örnek oluşturulur.
    Get.lazyPut<PostService>(() => PostService());
    /// HomeController sınıfı çağrıldığında PostService sınıfı da çağrılır.
    Get.lazyPut<HomeController>(() => HomeController(postService: Get.find<PostService>()));
  }
}
