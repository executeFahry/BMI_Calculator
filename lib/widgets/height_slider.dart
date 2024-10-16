import 'package:flutter/material.dart';
import '../constants.dart';

class HeightSlider extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;

  const HeightSlider({
    Key? key,
    required this.height,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Tinggi (cm)', style: kSubtitleTextStyle),
        Slider(
          activeColor: kPrimaryColor,
          inactiveColor: kSecondaryColor,
          value: height,
          min: 100,
          max: 220,
          onChanged: onChanged,
        ),
        Text('${height.toInt()} cm', style: kTitleTextStyle),
      ],
    );
  }
}
