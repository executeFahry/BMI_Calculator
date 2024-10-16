import 'package:flutter/material.dart';
import '../constants.dart';
import 'calculator_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.hourglass_empty_rounded,
              size: 30,
            ),
            Text(
              'BMI Calculator',
              style: kTitleTextStyle,
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: kBgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Apa itu BMI?',
              style: kSubtitleTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                'Body Mass Index (BMI) adalah ukuran yang digunakan untuk mengetahui apakah berat badan Anda '
                'ideal sesuai dengan tinggi badan. BMI membantu Anda memantau kesehatan dan menghindari risiko '
                'berbagai penyakit yang berhubungan dengan berat badan.',
                style: kContentTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            IntrinsicWidth(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalculatorPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(0, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Hitung BMI',
                        style: kButtonTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.ads_click_rounded, color: Colors.black),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
