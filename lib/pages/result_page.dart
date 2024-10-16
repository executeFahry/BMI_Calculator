import 'package:flutter/material.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final double bmiResult;
  final String resultText;
  final String advice;

  const ResultPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.advice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Skor BMI Anda',
              style: kTitleTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildBMIResultBox(), // Kotak Hasil BMI
            const SizedBox(height: 20),
            _buildBMIDescription(), // Deskripsi dan Saran BMI
            const Spacer(),
            // Tombol Hitung Ulang
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hitung Ulang', style: kButtonTextStyle),
                  const SizedBox(width: 10),
                  const Icon(Icons.refresh, color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan Hasil BMI di dalam kotak
  Widget _buildBMIResultBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kPrimaryColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Konten di tengah
        children: [
          // Tampilkan Nilai BMI di tengah
          Text(
            bmiResult.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center, // Teks rata tengah
          ),
          const SizedBox(height: 10),
          // Tampilkan Kategori BMI di bawah nilai BMI
          Text(
            resultText,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: resultText == 'Underweight'
                  ? Colors.yellow
                  : resultText == 'Normal'
                      ? Colors.green
                      : Colors.red,
            ),
            textAlign: TextAlign.center, // Teks rata tengah
          ),
          const SizedBox(height: 20),
          // Garis level kategori BMI
          Container(
            height: 10,
            width: 300, // Lebar garis level kategori
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(
                colors: [
                  Colors.yellow, // Underweight
                  Colors.green, // Normal
                  Colors.orange, // Overweight
                  Colors.red, // Obesity
                ],
                stops: [0.2, 0.5, 0.8, 1],
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Penanda posisi nilai BMI pada garis
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 10,
                width: 300, // Lebar yang sama dengan garis kategori
                color: Colors.transparent,
              ),
              Positioned(
                left: _getBMIMarkerPosition(), // Posisi penanda sesuai skor BMI
                child: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menghitung posisi penanda berdasarkan skor BMI
  double _getBMIMarkerPosition() {
    double markerPosition = 0;
    if (bmiResult < 18.5) {
      markerPosition =
          (bmiResult / 18.5) * 60; // Rentang Underweight (0-20% dari garis)
    } else if (bmiResult >= 18.5 && bmiResult <= 24.9) {
      markerPosition = 60 +
          ((bmiResult - 18.5) / (24.9 - 18.5)) *
              90; // Rentang Normal (20%-50% dari garis)
    } else if (bmiResult >= 25 && bmiResult <= 29.9) {
      markerPosition = 150 +
          ((bmiResult - 25) / (29.9 - 25)) *
              60; // Rentang Overweight (50%-80% dari garis)
    } else {
      markerPosition = 240 +
          ((bmiResult - 30) / 10) * 60; // Rentang Obesity (80%-100% dari garis)
    }
    return markerPosition.clamp(
        0.0, 300.0); // Jaga agar posisi tetap dalam rentang
  }

  // Widget untuk menampilkan deskripsi dan saran BMI
  Widget _buildBMIDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deskripsi/Saran BMI',
          style: kTitleTextStyle,
        ),
        const SizedBox(height: 10),
        Text(
          advice,
          style: kContentTextStyle,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
