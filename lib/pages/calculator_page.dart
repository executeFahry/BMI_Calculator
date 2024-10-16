import 'package:flutter/material.dart';
import '../constants.dart';
import 'result_page.dart';
import '../widgets/gender_card.dart';
import '../widgets/height_slider.dart';
import '../widgets/counter_card.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  bool isPria = true;
  double height = 170;
  int weight = 65;
  int age = 27;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GenderCard(
                      label: 'PRIA',
                      icon: Icons.male,
                      selected: isPria,
                      onTap: () {
                        setState(() => isPria = true);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GenderCard(
                      label: 'WANITA',
                      icon: Icons.female,
                      selected: !isPria,
                      onTap: () {
                        setState(() => isPria = false);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Slider tinggi badan
            HeightSlider(
              height: height,
              onChanged: (newHeight) {
                setState(() => height = newHeight);
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CounterCard(
                      label: 'Berat',
                      value: weight,
                      unit: 'kg',
                      onChanged: (newValue) {
                        setState(() => weight = newValue);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CounterCard(
                      label: 'Usia',
                      value: age,
                      unit: 'Tahun',
                      onChanged: (newValue) {
                        setState(() => age = newValue);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Tombol hitung BMI
            ElevatedButton(
              onPressed: () {
                // Hitung BMI
                double bmi = weight / ((height / 100) * (height / 100));
                String resultText = getResultText(bmi);
                String advice = getAdvice(bmi);

                // Navigasi ke ResultPage dan kirim hasil BMI, resultText, dan advice
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: bmi,
                      resultText: resultText,
                      advice: advice,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hitung',
                    style: kButtonTextStyle,
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.sync_rounded,
                    color: kBgColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk mendapatkan kategori BMI berdasarkan hasil
  String getResultText(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'Normal';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  // Fungsi untuk memberikan saran berdasarkan kategori BMI
  String getAdvice(double bmi) {
    if (bmi < 18.5) {
      return 'Anda perlu makan lebih banyak kalori.';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'Selamat! Berat badan Anda ideal.';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 'Cobalah untuk menurunkan berat badan dengan diet sehat.';
    } else {
      return 'Disarankan untuk berkonsultasi dengan dokter mengenai program penurunan berat badan.';
    }
  }
}
