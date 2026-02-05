import 'package:flutter/cupertino.dart';
import 'package:mood_diary/core/emotion/emotion.dart';
import 'package:mood_diary/presentation/widgets/emotion_card.dart';

class EmotionCarousel extends StatelessWidget {
  final Emotion? selectedEmotion;
  final List<Emotion> emotions;
  final ValueChanged<Emotion> onSelected;

  const EmotionCarousel({
    super.key,
    required this.selectedEmotion,
    required this.emotions,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 188,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: emotions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final emotion = emotions[index];
          final isSelected = selectedEmotion == emotion;

          return EmotionCard(
            name: emotion.name,
            imagePath: emotion.image,
            isSelected: isSelected,
            onTap: () => onSelected(emotion),
          );
        },
      ),
    );
  }
}
