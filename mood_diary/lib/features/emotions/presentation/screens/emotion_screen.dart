import 'package:flutter/material.dart';
import 'package:mood_diary/features/emotions/domain/emotion.dart';
import 'package:mood_diary/features/emotions/domain/emotion_details.dart';
import 'package:mood_diary/features/emotions/presentation/widgets/emotion_carousel.dart';
import 'package:mood_diary/features/emotions/presentation/widgets/emotion_tag.dart';
import 'package:mood_diary/features/emotions/presentation/widgets/labeled_slider.dart';
import 'package:mood_diary/features/emotions/presentation/widgets/notes_field.dart';
import 'package:mood_diary/features/emotions/presentation/widgets/save_button.dart';

class EmotionScreen extends StatefulWidget {
  const EmotionScreen({super.key});

  @override
  State<EmotionScreen> createState() => _EmotionScreenContent();
}

class _EmotionScreenContent extends State<EmotionScreen> {
  Emotion? _selectedEmotion;
  final List<Emotion> _emotions = Emotion.values;
  final TextEditingController notesController = TextEditingController();
  final Set<String> _selectedDetails = {};

  double _stressLevel = 50;
  double _selfEsteem = 50;

  bool _stressTouched = false;
  bool _selfEsteemTouched = false;

  @override
  void initState() {
    super.initState();
    notesController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    return _selectedEmotion != null &&
        notesController.text.trim().isNotEmpty &&
        (_stressTouched || _selfEsteemTouched);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Что чувствуешь?',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 20),

              EmotionCarousel(
                selectedEmotion: _selectedEmotion,
                emotions: _emotions,
                onSelected: (emotion) {
                  setState(() {
                    _selectedEmotion = emotion;
                  });
                },
              ),

              if (_selectedEmotion != null &&
                  emotionDetailsMap.containsKey(_selectedEmotion)) ...[
                const SizedBox(height: 16),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: emotionDetailsMap[_selectedEmotion]!
                      .map(
                        (detail) => EmotionTag(
                          text: detail,
                          isSelected: _selectedDetails.contains(detail),
                          onTap: () {
                            setState(() {
                              if (_selectedDetails.contains(detail)) {
                                _selectedDetails.remove(detail);
                              } else {
                                _selectedDetails.add(detail);
                              }
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              ],

              const SizedBox(height: 20),

              LabeledSlider(
                title: 'Уровень стресса',
                value: _stressLevel,
                onChanged: (value) {
                  setState(() {
                    _stressLevel = value;
                    _stressTouched = true;
                  });
                },
                leftLabel: 'Низкий',
                rightLabel: 'Высокий',
              ),

              const SizedBox(height: 20),

              LabeledSlider(
                title: 'Самооценка',
                value: _selfEsteem,
                onChanged: (value) {
                  setState(() {
                    _selfEsteem = value;
                    _selfEsteemTouched = true;
                  });
                },
                leftLabel: 'Неуверенность',
                rightLabel: 'Уверенность',
              ),

              const SizedBox(height: 20),

              NotesField(controller: notesController),

              const SizedBox(height: 20),

              Center(
                child: SaveButton(
                  isEnable: _isFormValid,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Text('Готово'),
                          content: const Text('Анкета успешно сохранена'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Ок'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
