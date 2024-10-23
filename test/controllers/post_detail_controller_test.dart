import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:post_case_study/controllers/post_detail_controller.dart';
import 'package:post_case_study/models/post_model.dart';
import 'package:post_case_study/services/post_service.dart';

import 'home_controller_test.mocks.dart';

// PostService için mock sınıfı oluşturmak üzere GenerateMocks anotasyonu
@GenerateMocks([PostService])
void main() {
  late PostDetailController controller;
  late MockPostService mockPostService;

  setUp(() {
    // Mock servisi başlat
    mockPostService = MockPostService();
    // Controller'a bağımlılık olarak mock servisi geçiyoruz
    controller = PostDetailController(postService: mockPostService);
  });

  group('PostDetailController Unit Tests', () {
    test('fetchPostDetail() should assign post detail', () async {
      // Mock veri hazırlığı
      final mockPost = PostModel(
        id: 1,
        title: 'Post Detail',
        content: 'Detailed content',
      );

      // fetchPostDetail() metodu çağrıldığında mock verileri döndür
      when(mockPostService.fetchPostDetail(1))
          .thenAnswer((_) async => mockPost);

      // Controller'ın fetchPostDetail metodunu çağır ve tamamlanmasını bekle
      await controller.fetchPostDetail(1);

      // Test sonuçları
      expect(controller.postDetail, isNotNull);
      expect(controller.postDetail?.title, 'Post Detail');
      expect(controller.postDetail?.content, 'Detailed content');
    });

    test('isLoading should be true while fetching post detail', () async {
      // fetchPostDetail() metodu çalıştığında isLoading değerinin kontrolü
      when(mockPostService.fetchPostDetail(1)).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 500));
        return PostModel(
          id: 1,
          title: 'Post Detail',
          content: 'Detailed content',
        );
      });

      // fetchPostDetail çağrıldığında isLoading ilk önce true olmalı
      expect(controller.isLoading.value, true);
      final fetchFuture = controller.fetchPostDetail(1);
      expect(controller.isLoading.value, true);

      // fetchPostDetail tamamlandığında isLoading false olmalı
      await fetchFuture;
      expect(controller.isLoading.value, false);
    });
  });
}
