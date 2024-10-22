import 'package:get/get.dart';
import '../controllers/bindings/home_binding.dart';
import '../controllers/bindings/post_detail_binding.dart';
import '../views/home_view.dart';
import '../views/post_detail_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      
    ),
    GetPage(
      name: AppRoutes.POST_DETAIL,
      page: () => const PostDetailView(),
      binding: PostDetailBinding(),
    ),
  ];
}
