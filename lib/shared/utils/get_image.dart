import 'package:quotify/shared/constants/app_images.dart';

String getImage(String category) => switch (category) {
      'Bíblicos' => AppImages.bible,
      'Motivação' => AppImages.motivation,
      'Humor' => AppImages.humor,
      'Tecnologia' => AppImages.technology,
      _ => AppImages.defaultImage,
    };
