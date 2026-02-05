import 'package:mood_diary/core/constants/app_images.dart';

enum Emotion { joy, fear, rage, sadness, calm, power }

extension EmotionExtension on Emotion {
  String get name {
    switch (this) {
      case Emotion.joy:
        return 'Радость';
      case Emotion.fear:
        return 'Страх';
      case Emotion.rage:
        return 'Бешенство';
      case Emotion.sadness:
        return 'Грусть';
      case Emotion.calm:
        return 'Спокойствие';
      case Emotion.power:
        return 'Сила';
    }
  }

  String get image {
    switch (this) {
      case Emotion.joy:
        return AppImages.emotionJoyImage;
      case Emotion.fear:
        return AppImages.emotionFearImage;
      case Emotion.rage:
        return AppImages.emotionRabiesImage;
      case Emotion.sadness:
        return AppImages.emotionSadnessImage;
      case Emotion.calm:
        return AppImages.emotionCalmnessImage;
      case Emotion.power:
        return AppImages.emotionPowerImage;
    }
  }
}
