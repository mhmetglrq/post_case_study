import 'package:get/get.dart';
import '../../services/post_service.dart';
import '../home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Öncelikle PostService'in bağımlılığını ekliyoruz
    Get.lazyPut<PostService>(() => PostService());
    Get.lazyPut<HomeController>(() => HomeController(postService: Get.find<PostService>()));
  }
}
