import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/post_service.dart';

class HomeController extends GetxController {
  final PostService postService;

  HomeController({required this.postService});

  var posts = <PostModel>[].obs;
  var filteredPosts = <PostModel>[].obs;
  var categories = <String>[].obs;
  var isLoading = true.obs;
  var selectedCategory = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      var fetchedPosts = await postService.fetchPosts();
      if (fetchedPosts != null) {
        posts.assignAll(fetchedPosts);
        categories.assignAll(
            fetchedPosts.map((e) => e.category ?? "").toSet().toList());
        selectedCategory.value = categories.first;
        filteredPosts.assignAll(fetchedPosts);
      }
    } finally {
      isLoading(false);
    }
  }

  void filterPosts(String category) {
    selectedCategory.value = category;
    filteredPosts
        .assignAll(posts.where((post) => post.category == category).toList());
  }

  void searchPosts(String query) {
    filteredPosts.assignAll(posts
        .where(
            (post) => post.title!.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }
}
