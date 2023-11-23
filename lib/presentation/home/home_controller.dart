import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quotify/core/data/models/categories.dart';
import 'package:quotify/core/data/models/phrase.dart';
import 'package:quotify/presentation/blocs/categories/categories_bloc.dart';
import 'package:quotify/presentation/blocs/categories/categories_events.dart';
import 'package:quotify/presentation/blocs/phrase/phrase_bloc.dart';
import 'package:quotify/presentation/blocs/phrase/phrase_events.dart';
import 'package:quotify/shared/constants/app_images.dart';
import 'package:quotify/shared/utils/get_image.dart';

class HomeController extends GetxController {
  late final CategoriesBloc categoriesBloc;
  late final PhraseBloc phraseBloc;

  final _category = Category().obs;
  final _iconCopy = Icons.copy.obs;
  final _imageBackground = AppImages.defaultImage.obs;

  IconData get iconCopy => _iconCopy.value;
  Category get category => _category.value;
  String get imageBackground => _imageBackground.value;

  void randomPhrase() {
    if (category.id != null) {
      phraseBloc.add(LoadPhrasesEvent(categoryId: category.id!));
      return;
    }

    phraseBloc.add(LoadPhrasesEvent());
    update();
  }

  void onChangedCategory(Category? category) {
    Get.back();
    _category.value = category!;
    _imageBackground.value = getImage(category.name!);
    update();
    phraseBloc.add(LoadPhrasesEvent(categoryId: category.id!));
  }

  void copyPhrase(Phrase phrase) {
    final String text = '${phrase.content!}\n\n${phrase.phraseMaster!}';
    Clipboard.setData(ClipboardData(text: text));

    _iconCopy.value = Icons.check;
    update();

    Future.delayed(const Duration(seconds: 3), () {
      _iconCopy.value = Icons.copy;
      update();
    });
  }

  @override
  void onInit() {
    categoriesBloc = CategoriesBloc();
    phraseBloc = PhraseBloc();

    categoriesBloc.add(LoadCategoriesEvent());
    phraseBloc.add(LoadPhrasesEvent());

    super.onInit();
  }

  @override
  void onClose() {
    categoriesBloc.close();
    phraseBloc.close();
    super.onClose();
  }
}
