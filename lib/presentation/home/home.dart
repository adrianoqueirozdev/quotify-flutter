import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quotify/core/data/models/categories.dart';
import 'package:quotify/presentation/blocs/categories/categories_bloc.dart';
import 'package:quotify/presentation/blocs/categories/categories_state.dart';
import 'package:quotify/presentation/blocs/phrase/phrase_bloc.dart';
import 'package:quotify/presentation/blocs/phrase/phrase_state.dart';
import 'package:quotify/presentation/home/home_controller.dart';
import 'package:quotify/shared/constants/app_images.dart';
import 'package:quotify/shared/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return BlocBuilder<PhraseBloc, PhraseState>(
          bloc: controller.phraseBloc,
          builder: (context, state) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                foregroundColor: colorScheme.onPrimary,
                toolbarHeight: 74,
                title: SvgPicture.asset(
                  AppImages.logo2,
                  width: 150,
                ),
                actions: [
                  IconButton(
                    onPressed: () => controller.copyPhrase(state.phrase!),
                    icon: Icon(controller.iconCopy),
                  ),
                ],
              ),
              body: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  image: DecorationImage(
                    image: AssetImage(controller.imageBackground),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.8),
                  child: Center(
                    child: Builder(builder: (context) {
                      if (state is PhraseInitial) {
                        return const CircularProgressIndicator();
                      } else if (state is PhraseSuccess) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          height: size.height * 0.75,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '"',
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.onPrimary,
                                    ),
                                    children: [
                                      TextSpan(
                                        style: textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: colorScheme.onPrimary,
                                        ),
                                        text: "${state.phrase!.content}",
                                      ),
                                      TextSpan(
                                        text: '"',
                                        style: textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme.onPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ).animate().fadeIn(),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 1,
                                      color: colorScheme.onPrimary.withOpacity(0.8),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "${state.phrase!.phraseMaster}",
                                      textAlign: TextAlign.end,
                                      style: textTheme.labelMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: colorScheme.onPrimary.withOpacity(0.8),
                                      ),
                                    ),
                                  ].animate().slideX(
                                        duration: 500.ms,
                                        begin: -1,
                                        end: 0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          state.error!,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              bottomSheet: SlideInUp(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: controller.randomPhrase,
                        icon: Icon(
                          Icons.refresh,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: controller.category.name ?? "Selecione uma categoria",
                                hintStyle: textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onPrimary.withOpacity(0.8),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.expand_more,
                                    color: colorScheme.onPrimary,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: InkWell(
                                radius: 16,
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: AppColors.primaryColor,
                                    context: context,
                                    builder: (context) {
                                      return GetBuilder<HomeController>(
                                        init: HomeController(),
                                        builder: (controller) {
                                          return Container(
                                            padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16, top: 16),
                                            height: 280,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        "Selecione uma categoria",
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: textTheme.titleLarge?.copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          color: colorScheme.onPrimary,
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () => Get.back(),
                                                      icon: Icon(
                                                        Icons.close,
                                                        color: colorScheme.onPrimary,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                BlocBuilder<CategoriesBloc, CategoriesState>(
                                                  bloc: controller.categoriesBloc,
                                                  builder: (context, state) {
                                                    if (state is CategoriesInitial) {
                                                      return const Center(
                                                        child: CircularProgressIndicator(),
                                                      );
                                                    } else if (state is CategoriesSuccess) {
                                                      return Expanded(
                                                        child: ListView.builder(
                                                          itemCount: state.categories!.length,
                                                          itemBuilder: (context, index) {
                                                            final category = state.categories![index];

                                                            return RadioListTile<Category>(
                                                              dense: true,
                                                              contentPadding: EdgeInsets.zero,
                                                              value: category,
                                                              title: Text(
                                                                category.name!,
                                                                style: textTheme.bodyMedium?.copyWith(
                                                                  color: colorScheme.onPrimary,
                                                                ),
                                                              ),
                                                              groupValue: controller.category,
                                                              selected: category == controller.category,
                                                              activeColor: colorScheme.onPrimary,
                                                              onChanged: controller.onChangedCategory,
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    }
                                                    return Padding(
                                                      padding: const EdgeInsets.all(24),
                                                      child: Text(
                                                        state.error!,
                                                        textAlign: TextAlign.center,
                                                        style: textTheme.bodyLarge?.copyWith(
                                                          fontWeight: FontWeight.w600,
                                                          color: colorScheme.onPrimary,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
