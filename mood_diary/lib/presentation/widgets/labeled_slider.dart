import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class LabeledSlider extends StatelessWidget {
  final String title;
  final double value;
  final ValueChanged<double> onChanged;
  final String leftLabel;
  final String rightLabel;

  const LabeledSlider({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.leftLabel,
    required this.rightLabel,
  });

  @override
  Widget build(BuildContext context) {
    const double min = 0;
    const double max = 100;
    const double step = 25;
    const int tickCount = 6;

    final double snappedValue = (value / step).round() * step;
    final bool hideCenterDot = snappedValue >= 50;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 16),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                width: 335,
                height: 44,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    const double inset = 24;
                    final double trackWidth = constraints.maxWidth - inset * 2;

                    double pos(double v) => inset + (v / max) * trackWidth;

                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: inset,
                          right: inset,
                          top: 20,
                          child: CustomPaint(
                            size: Size(trackWidth, 4),
                            painter: _TrackPainter(snappedValue),
                          ),
                        ),

                        for (int i = 0; i < tickCount; i++)
                          Positioned(
                            left:
                                inset + (i / (tickCount - 1)) * trackWidth - 1,
                            top: 6,
                            child: Container(
                              width: 2,
                              height: 8,
                              color: AppColors.textPrimaryColor.withOpacity(
                                0.6,
                              ),
                            ),
                          ),

                        if (!hideCenterDot)
                          Positioned(
                            left: pos(50) - 5,
                            top: 17,
                            child: _grayDot(),
                          ),

                        Positioned(
                          left: inset,
                          width: trackWidth,
                          top: 0,
                          bottom: 0,
                          child: SfSlider(
                            min: min,
                            max: max,
                            value: snappedValue,
                            stepSize: step,
                            showTicks: false,
                            showLabels: false,
                            enableTooltip: false,
                            activeColor: Colors.transparent,
                            inactiveColor: Colors.transparent,
                            onChanged: (v) =>
                                onChanged((v / step).round() * step),
                          ),
                        ),

                        Positioned(
                          left: pos(snappedValue) - 8,
                          top: 14,
                          child: _orangeThumb(),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(leftLabel, style: _labelStyle),
                    Text(rightLabel, style: _labelStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TrackPainter extends CustomPainter {
  final double value;

  _TrackPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final active = Paint()
      ..color = AppColors.primaryButtonColor
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final inactive = Paint()
      ..color = AppColors.colorPicker
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final double activeWidth = size.width * value / 100;

    canvas.drawLine(Offset(0, 2), Offset(activeWidth, 2), active);
    canvas.drawLine(Offset(activeWidth, 2), Offset(size.width, 2), inactive);
  }

  @override
  bool shouldRepaint(_) => true;
}

Widget _grayDot() => Container(
  width: 10,
  height: 10,
  decoration: BoxDecoration(
    color: AppColors.textPrimaryColor,
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white, width: 1.5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  ),
);

Widget _orangeThumb() => Container(
  width: 16,
  height: 16,
  decoration: BoxDecoration(
    color: AppColors.primaryButtonColor,
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  ),
);

const _labelStyle = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w400,
  color: AppColors.textPrimaryColor,
);
