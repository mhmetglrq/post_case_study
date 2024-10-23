import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/post_service.dart';

class HomeController extends GetxController {
  /// Post servis sınıfı. API'den gönderileri almak için kullanılır.
  final PostService postService;

  HomeController({required this.postService});

  /// API'den alınan tüm gönderileri tutar.
  var posts = <PostModel>[].obs;

  /// Filtrelenmiş gönderileri tutar. Kullanıcının seçtiği kategoriye göre gönderiler filtrelenir.
  var filteredPosts = <PostModel>[].obs;

  /// Tüm kategorileri tutar.
  var categories = <String>[].obs;

  /// API çağrısı devam ederken yükleme durumunu tutar.
  var isLoading = true.obs;

  /// Kullanıcının seçtiği kategoriyi tutar.
  var selectedCategory = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  /// API'den gönderileri çeker ve gerekli verilere atama yapar.
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

  /// Belirli bir kategoriye göre gönderileri filtreler.
  void filterPosts(String category) {
    selectedCategory.value = category;
    filteredPosts
        .assignAll(posts.where((post) => post.category == category).toList());
  }

  /// Arama sorgusuna göre gönderileri filtreler.
  void searchPosts(String query) {
    filteredPosts.assignAll(posts
        .where(
            (post) => post.title!.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }
}
