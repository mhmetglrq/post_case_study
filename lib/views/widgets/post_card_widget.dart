import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:post_case_study/config/extensions/context_extension.dart';
import 'package:post_case_study/routes/app_routes.dart';
import '../../config/utilities/utils/date_utils.dart';
import '../../models/post_model.dart';
import 'package:get/get.dart';

class PostCardWidget extends StatelessWidget {
  final PostModel post;

  const PostCardWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.POST_DETAIL, arguments: post.id),
      child: Padding(
        padding: context.paddingAllLow,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildThumbnail(context),
            SizedBox(width: context.dynamicWidth(0.04)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(context),
                  SizedBox(height: context.dynamicHeight(0.01)),
                  _buildDateRow(context, post),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Küçük resim bileşeni
  Widget _buildThumbnail(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: post.thumbnail ?? "",
      height: context.dynamicHeight(0.18),
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator.adaptive()),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
    );
  }

  /// Başlık bileşeni
  Widget _buildTitle(BuildContext context) {
    return Text(
      post.title ?? 'No available title',
      style: context.textTheme.titleSmall,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Tarih ve okuma süresi bileşeni
  Widget _buildDateRow(BuildContext context, PostModel post) {
    return Row(
      children: [
        Text(
          "${DateFormatUtils.formatDate(post.publishedAt)} • ",
          style: context.textTheme.bodySmall,
        ),
        Text(
          DateFormatUtils.calculateReadingTime(post.content ?? ""),
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}
