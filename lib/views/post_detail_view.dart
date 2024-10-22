import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:post_case_study/config/extensions/context_extension.dart';
import '../config/utilities/enums/image_enum.dart';
import '../config/items/app_colors.dart';
import '../config/utilities/utils/date_utils.dart';
import '../controllers/post_detail_controller.dart';
import '../models/post_model.dart';

class PostDetailView extends GetView<PostDetailController> {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Stack(
            children: [
              _buildAppBar(context),
              const Center(child: CircularProgressIndicator.adaptive()),
            ],
          );
        } else if (controller.postDetail == null) {
          return Stack(
            children: [
              _buildAppBar(context),
              const Center(child: Text('Failed to load post details')),
            ],
          );
        } else {
          final post = controller.postDetail!;
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    _buildImageSection(context, post),
                    _buildContentSection(context, post),
                  ],
                ),
              ),
              _buildAppBar(context),
            ],
          );
        }
      }),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: context.paddingHorizontalLow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.adaptive.arrow_back,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14),
                child: SvgPicture.asset(
                  ImageEnum.menu.toSvg,
                  height: context.dynamicHeight(0.04),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context, PostModel post) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CachedNetworkImage(
          imageUrl: post.image ?? "",
          fit: BoxFit.cover,
          height: context.dynamicHeight(0.4),
          width: double.infinity,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator.adaptive()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Padding(
          padding: context.paddingBottomDefault,
          child: Card(
            color: AppColors.kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: context.paddingAllLow,
              child: Text(
                post.category ?? "No Category",
                style: context.textTheme.titleSmall,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContentSection(BuildContext context, PostModel post) {
    return Padding(
      padding: context.paddingAllDefault,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.paddingVerticalLow,
            child: Text(
              post.title ?? 'No available title',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: context.paddingVerticalLow,
            child: Text(
              post.content ?? 'No available content',
              style:
                  context.textTheme.bodyMedium?.copyWith(color: Colors.black54),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
              padding: context.paddingVerticalHigh,
              child: _buildDateRow(context, post)),
        ],
      ),
    );
  }

  Widget _buildDateRow(BuildContext context, PostModel post) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormatUtils.formatDate(post.publishedAt),
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
