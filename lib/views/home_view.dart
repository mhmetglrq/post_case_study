import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:post_case_study/config/utilities/enums/image_enum.dart';
import 'package:post_case_study/config/extensions/context_extension.dart';
import '../config/items/app_colors.dart';
import '../controllers/home_controller.dart';
import 'widgets/post_card_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return SafeArea(
            bottom: false,
            child: Padding(
              padding: context.paddingAllDefault,
              child: Column(
                children: [
                  _buildAppBar(context),
                  _buildSearchField(context),
                  _buildCategoryList(context),
                  _buildPostList(),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            ImageEnum.menu.toSvg,
            height: context.dynamicHeight(0.04),
          ),
        ),
        Container(
          height: context.dynamicHeight(0.04),
          decoration: BoxDecoration(
            color: AppColors.kGreyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const AspectRatio(aspectRatio: 1),
        ),
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalDefault,
      child: TextField(
        onChanged: (value) => controller.searchPosts(value),
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Padding(
            padding: context.paddingAllLow,
            child: SvgPicture.asset(ImageEnum.search.toSvg),
          ),
          hintStyle: context.textTheme.bodyMedium,
          contentPadding: EdgeInsets.symmetric(
            horizontal: context.dynamicWidth(0.07),
            vertical: context.dynamicHeight(0.015),
          ),
          fillColor: AppColors.kLightGreyColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.07),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.filterPosts(controller.categories[index]);
              controller.selectedCategory.value = controller.categories[index];
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return Text(
                  controller.categories[index],
                  style: context.textTheme.titleMedium?.copyWith(
                    color: controller.selectedCategory.value ==
                            controller.categories[index]
                        ? AppColors.kBlackColor
                        : AppColors.kGreyColor,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPostList() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.filteredPosts.length,
        itemBuilder: (context, index) {
          return PostCardWidget(post: controller.filteredPosts[index]);
        },
      ),
    );
  }
}
