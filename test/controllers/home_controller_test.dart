import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:post_case_study/controllers/home_controller.dart';
import 'package:post_case_study/models/post_model.dart';
import 'package:post_case_study/services/post_service.dart';

import 'home_controller_test.mocks.dart';

/// PostService için mock sınıfı oluşturmak üzere GenerateMocks anotasyonu
@GenerateMocks([PostService])
void main() {
  late HomeController controller;
  late MockPostService mockPostService;

  setUp(() {
    /// Mock servisi başlat
    mockPostService = MockPostService();
    /// Controller'a bağımlılık olarak mock servisi geçiyoruz
    controller = HomeController(postService: mockPostService);
  });

  group('HomeController Unit Tests', () {
    test('fetchPosts() should assign posts and categories', () async {
      /// Veri Hazırlığı
      final mockPosts = [
        PostModel(id: 1, title: 'Post 1', category: 'Tech'),
        PostModel(id: 2, title: 'Post 2', category: 'Health'),
      ];

      /// fetchPosts() metodu çağrıldığında mock verileri döndür
      when(mockPostService.fetchPosts()).thenAnswer((_) async => mockPosts);

      /// Controller'ın fetchPosts metodunu çağır ve tamamlanmasını bekle

      await controller.fetchPosts();

      /// Test sonuçları
      expect(controller.posts.length, 2);
      expect(controller.posts[0].title, 'Post 1');
      expect(controller.categories.length, 2);
      expect(controller.categories.contains('Tech'), true);
    });

    test('filterPosts() should filter posts by category', () {
      /// Test verileri
      controller.posts.assignAll([
        PostModel(id: 1, title: 'Post 1', category: 'Tech'),
        PostModel(id: 2, title: 'Post 2', category: 'Health'),
        PostModel(id: 3, title: 'Post 3', category: 'Tech'),
      ]);

      /// "Tech" kategorisiyle filtreleme işlemi
      controller.filterPosts('Tech');

      // Test sonuçları
      expect(controller.filteredPosts.length, 2);
      expect(controller.filteredPosts[0].title, 'Post 1');
      expect(controller.filteredPosts[1].title, 'Post 3');
    });

    test('searchPosts() should filter posts by title', () {
      /// Test verileri
      controller.posts.assignAll([
        PostModel(id: 1, title: 'Flutter Tips', category: 'Tech'),
        PostModel(id: 2, title: 'Health Guide', category: 'Health'),
      ]);

      /// "Flutter" kelimesine göre filtreleme işlemi
      controller.searchPosts('Flutter');

      /// Test sonuçları
      expect(controller.filteredPosts.length, 1);
      expect(controller.filteredPosts[0].title, 'Flutter Tips');
    });
  });
}
