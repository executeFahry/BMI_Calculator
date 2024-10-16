import 'package:flutter/material.dart';
import '../constants.dart';

class CounterCard extends StatelessWidget {
  final String label;
  final int value;
  final String unit;
  final ValueChanged<int> onChanged;

  const CounterCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: kCardTextStyle),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _counterButton(Icons.remove, () {
                if (value > 1) onChanged(value - 1);
              }),
              const SizedBox(width: 10),
              Text('$value', style: kSubtitleTextStyle),
              const SizedBox(width: 10),
              _counterButton(Icons.add, () {
                onChanged(value + 1);
              }),
            ],
          ),
          const SizedBox(height: 10),
          Text(unit, style: kCardTextStyle),
        ],
      ),
    );
  }

  // Tombol counter widget
  Widget _counterButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8),
        backgroundColor: kPrimaryColor,
      ),
      child: Icon(
        icon,
        color: kBgColor,
      ),
    );
  }
}
